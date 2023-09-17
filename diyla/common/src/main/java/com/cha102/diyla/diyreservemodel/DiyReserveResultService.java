package com.cha102.diyla.diyreservemodel;

import org.springframework.stereotype.Service;

import com.cha102.diyla.diyOrder.DiyOrderDTO;
import com.cha102.diyla.diyOrder.DiyOrderService;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@Service
public class DiyReserveResultService {
    @Resource
    private DiyReserveResultEntityRepository reserveResultRepository;

    // 根據日期範圍獲取項目數量
    public List<DIYReserveVO[]> getItemQuantityByDateRange(Date endDate) {
        return reserveResultRepository.getItemQuantityByDateRange(endDate);
    }
    public List<DIYReserve2VO[]> getPeoCountByDateRange(Date endDate) {
        return reserveResultRepository.getPeoCountByDateRange(endDate);
    }

    // 執行預訂
    public DiyReserveResultEntity insert(DiyReserveResultEntity diyReserveResultEntity) {
        int selectedPeriod = diyReserveResultEntity.getDiyPeriod();
        int currentPeoCount = getCurrentPeoCount(selectedPeriod);

        if (currentPeoCount >= 10) {
            // 設定RESERVE_STATUS為1（不可預約）
            diyReserveResultEntity.setReserveStatus(1);
        } else {
            // 設定RESERVE_STATUS為0（可預約）
            diyReserveResultEntity.setReserveStatus(0);
        }

        // 設定PEO_LIMIT為剩餘可用位數
        diyReserveResultEntity.setPeoLimit(10 - currentPeoCount);

        // 根據需要設定其他欄位（DIY_RESERVE_DATE、RESERVE_UPD_TIME、ITEM_QUANTITY）

        // 儲存預訂
        return reserveResultRepository.save(diyReserveResultEntity);
    }
    // 獲取所選時段的當前PEO_COUNT
    public int getCurrentPeoCount(int selectedPeriod) {

        return 0;
    }
    public DiyReserveResultEntity findById(int id) {
        return reserveResultRepository.findById(id).get();
    }
    
    
    /**
     * @return
     *
     */
    
    public List<DiyReserveResultEntity> newVacancyAllSummary(){  // 先創30天的空彙總表
    	 Date currentDate = new Date();
    	    Calendar calendar = Calendar.getInstance();
    	    calendar.setTime(currentDate);
    	    Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
    	
    	for(int i =1 ; i<=30;i++) {
    		
    		for(int j=0;j<=2;j++) 	{
    	 
    		DiyReserveResultEntity diyReserveResultEntity = new DiyReserveResultEntity();
    		diyReserveResultEntity.setDiyReserveDate(currentDate); 
    		diyReserveResultEntity.setDiyPeriod(j);
    		diyReserveResultEntity.setPeoCount(0);
    		diyReserveResultEntity.setReserveStatus(0);
    		diyReserveResultEntity.setReserveUpdTime(currentTimestamp);
    		diyReserveResultEntity.setPeoLimit(20);
    		diyReserveResultEntity.setItemQuantity(20);
    		reserveResultRepository.save(diyReserveResultEntity);
    			
    			
    		}
    		
    		calendar.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = calendar.getTime();
    	}
    	
    	
    	
		return null;
    	
    }
    
    
    
    
    
    
    
    
    public List<DiyReserveResultEntity> setSummaryFromOrderPeriod() {  //增\\將diyOrder 所有訂單以日期、時段groupBy---去計算人數，再放到資料庫
    	
    	DiyOrderService DOser = new DiyOrderService();
    	List<DiyOrderDTO> diyOrderDTOList = DOser.getPeoCount();
    	List<DiyReserveResultEntity> diyReserveResultEntityList = new LinkedList<>();
    	for (DiyOrderDTO diyOrderDTO : diyOrderDTOList) {
    		
    		
    		
    		DiyReserveResultEntity diyReserveResultEntity = new DiyReserveResultEntity();
    		diyReserveResultEntity.setDiyReserveDate(diyOrderDTO.getDiyReserveDate());
    		diyReserveResultEntity.setDiyPeriod(diyOrderDTO.getDiyPeriod());
    		diyReserveResultEntity.setPeoCount(diyOrderDTO.getPeopleCount());
    		
    		
    		if(diyOrderDTO.getPeopleCount()<20) {
    			diyReserveResultEntity.setReserveStatus(0);
    		}else {
    			diyReserveResultEntity.setReserveStatus(1);
    		}
    		
    		diyReserveResultEntity.setPeoLimit(20 - diyOrderDTO.getPeopleCount());
    		
    		System.out.println(diyOrderDTO.getPeopleCount());
    		////////
    		diyReserveResultEntity.setItemQuantity(20 - diyOrderDTO.getPeopleCount());
    	
    		
    		diyReserveResultEntityList.add(diyReserveResultEntity);
    	}     	
        return diyReserveResultEntityList;
    }
 
    
    
    
    
    
    
    
    
    
    
    
public List<DiyReserveResultEntity> getAllSummaryFromOrder() {  // 恆旭更動  -- 找所有筆數彙總日期時段
        return reserveResultRepository.findAll();
    }


public DiyReserveResultEntity getOneSummary(Date diyReserveDate, Integer diyPeriod ) {  // 恆旭更動  -- 找單筆筆數彙總日期時段
    return reserveResultRepository.getOneSummary(diyReserveDate, diyPeriod);
}

public Optional<DiyReserveResultEntity> getOneSummaryNo(Integer diyReserveNo) {  // 恆旭更動  -- 找單筆數彙總日期時段
    return reserveResultRepository.findById(diyReserveNo);
}




//public DiyReserveResultEntity updataOneSummary(Date diyReserveDate, Integer diyPeriod,  ) { // 恆旭更動  -- 修改彙總日期時段
//	
//	diyReserveResultEntity
//	
//    return reserveResultRepository.getOneSummary(diyReserveDate, diyPeriod);
//}

public List<DiyReserveResultEntity> getAllGroups(){
        return reserveResultRepository.findAll();
}


}



