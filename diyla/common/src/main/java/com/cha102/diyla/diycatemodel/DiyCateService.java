package com.cha102.diyla.diycatemodel;

import com.cha102.diyla.util.PageBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DiyCateService {

    @Resource
    DiyCateRepository diyCateRepository;

    public DiyCateEntity findById(int id){
        return diyCateRepository.findById(id).get();
    }

    // 取得所有 DIY 分類資料，並進行分頁
    public Page<DiyCateEntity> getAllDiyCates(PageBean pageBean) {

        // 建立排序條件
        Sort sort = Sort.by(Sort.Direction.DESC, "diyNo");

        // 建立分頁設定
        Pageable pageable = PageRequest.of(pageBean.getPage() - 1, pageBean.getRows(),sort);

        // 呼叫 DIY 分類資料庫存取介面以進行查詢並回傳分頁結果
        return diyCateRepository.findAll(pageable);
    }

    // 根據 ID 取得特定 DIY 分類資料
    public DiyCateEntity getDiyCateById(int id) {
        return diyCateRepository.findById(id).orElse(null);
    }

    // 儲存 DIY 分類資料
    public DiyCateEntity saveDiyCate(DiyCateEntity diyCate) {
        return diyCateRepository.save(diyCate);
    }

    // 刪除指定 ID 的 DIY 分類資料
    public void deleteDiyCate(int id) {
        diyCateRepository.deleteById(id);
    }

    // 瀏覽 DIY 列表
    public List<DiyCateEntity> getAllDiyCates() {
        return diyCateRepository.findAllPutOn();
    }
    
    public List<DiyCateEntity> getAllNotPutOn(){
    	return diyCateRepository.findAll();
    }
    
}
