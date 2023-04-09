package com.edu.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.common.util.SearchCriteria;
import com.edu.product.dto.ProductDTO;
import com.edu.review.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Inject 
	private static String Namespace = "com.edu.review";
	
	// 리뷰 목록 보여주기
	@Override
	public List<ReviewDTO> reviewList(SearchCriteria sCri) throws Exception {
		
		return sqlSession.selectList(Namespace +  ".reviewList", sCri);
	}
	
	// 전체 페이지 가져오기
	@Override
	public int reviewListTotalCount(SearchCriteria sCri) throws Exception {
	
		return sqlSession.selectOne(Namespace + ".reviewListTotalCount", sCri);
	}
	
	// 리뷰 전체 목록 가져오기 
	@Override
	public List<ReviewDTO> reviewTotalList() throws Exception {
		List<ReviewDTO> reviewList = sqlSession.selectList(Namespace + ".totalList");
		
		return reviewList;
	}
	
	// 리뷰 등록하기
	@Override
	public int reviewRegister(ReviewDTO reviewDTO) throws Exception {
		
		System.out.println("ReviewDAOImpl 리뷰 등록하기");
		
		return sqlSession.insert(Namespace + ".reviewRegister", reviewDTO);
	}
	
	// productList 가져오기
	@Override
	public List<ProductDTO> productList(ProductDTO productDTO) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productList", productDTO);
	}

	@Override
	public List<ProductDTO> searchname(String produt_type) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".searchname", produt_type);
	}
	

	

	
	
	
	

}