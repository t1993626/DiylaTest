package com.cha102.diyla.shoppingcart;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartServiceSpring {
	@Resource
	ShoppingCartRepository shoppingCartRepository;

	@Override
	public void insert(ShoppingCartVO shoppingCartVO) {
		Integer memId = shoppingCartVO.getMemId();
		Integer comNo = shoppingCartVO.getComNo();
		Integer comAmount = shoppingCartVO.getComAmount();

		// 查是否存在相同香品
		Optional<ShoppingCartVO> existingCartItem = shoppingCartRepository.findByMemIdAndComNo(memId, comNo);

		if (existingCartItem.isPresent()) {
			// 已存在則加數量
			ShoppingCartVO existingCart = existingCartItem.get();
			existingCart.setComAmount(existingCart.getComAmount() + comAmount);
			shoppingCartRepository.save(existingCart);
		} else {
			// 不存在則直接加新商品
			shoppingCartRepository.save(shoppingCartVO);
		}
	}

	@Modifying
	@Transactional
	@Override
	public void update(ShoppingCartVO shoppingCartVO) {
		shoppingCartRepository.save(shoppingCartVO);
	}

	@Modifying
	@Transactional
	@Override
	public void delete(Integer memId, Integer comNo) {
		shoppingCartRepository.deleteByMemIdAndComNo(memId, comNo);
	}

	@Modifying
	@Transactional
	@Override
	public void deleteByMemId(Integer memId) {
		shoppingCartRepository.deleteByMemId(memId);
	}

//	@Override
	public List<ShoppingCartVO> findByMemId(Integer memId) {
		List<Object[]> result = shoppingCartRepository.getCartList(memId);
		List<ShoppingCartVO> cartList = new ArrayList<>();
		for (Object[] row : result) {
			ShoppingCartVO cartVO = new ShoppingCartVO();
			//順序要對上sql查詢語句順序
			cartVO.setMemId((Integer) row[0]);
			cartVO.setComNo((Integer) row[1]);
			cartVO.setComAmount((Integer) row[2]);
			cartVO.setComName((String) row[3]);
			cartVO.setComPri((Integer) row[4]);
			cartVO.setComPic((byte[]) row[5]);

			cartList.add(cartVO);
		}

		return cartList;
	}

	@Override
	public Optional<ShoppingCartVO> findByMemIdAndComNo(Integer memId, Integer comNo) {
		return shoppingCartRepository.findByMemIdAndComNo(memId, comNo);
	}
	@Override
	public void setShowPic(ShoppingCartVO cartVO) {
		cartVO.setShowPic("data:image/png;base64," + Base64.getEncoder().encodeToString(cartVO.getComPic()));
	}

	@Override
	public Integer getTotalPrice(Integer memId) {
		return shoppingCartRepository.getTotalPrice(memId);
	}
	
	public Integer getTotalAmount(Integer memId) {
		return shoppingCartRepository.getTotalAmount(memId);
	}


}
