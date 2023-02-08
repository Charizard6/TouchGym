package com.myspring.TouchGym.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;




@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List loginToday() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.loginToday");
		return membersList;
	}
	@Override
	public List lockerInfo() throws DataAccessException {
		List<LockerVO> lockersList = null;
		lockersList = sqlSession.selectList("mapper.locker.selectAllLocker");
		return lockersList;
	}
	@Override
	public int modLocker(LockerVO lockerVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.locker.modLocker", lockerVO);
		return result;
	}
	
	@Override
	public int insertLogin(String id) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertLogin", id);
		return result;
	} 
	
	@Override
	public int modMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.modMember", memberVO);
		return result;
	}
	@Override
	public int modDate(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.modDate", memberVO);
		return result;
	}
	
	@Override
	public List selectChosenMember(String id) throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectChosenMember", id);
		System.out.println(membersList.toString());
		return membersList;
	}
	@Override
	public List selectChosenPayment(String id) throws DataAccessException{
		List<PaymentVO> paymentsList = null;
		paymentsList = sqlSession.selectList("mapper.payment.selectChosenPayment", id);
		String a = paymentsList.toString();
		System.out.println(a);
		return paymentsList;
	}
	@Override
	public int insertPayment(PaymentVO paymentVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.payment.insertPayment", paymentVO);
		return result;
	}
	
	@Override
	public List getLogin(String id) throws DataAccessException{
		List<MemberVO> memberList = null;
		memberList = sqlSession.selectList("mapper.member.getLogin",id);
		return memberList;
	}
	
	@Override
	public List selectChosenMemberList(String id) throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectChosenMemberList", id);
		return membersList;
	}
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	@Override
	public List selectIdList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectIdList");
		return membersList;
	}
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}
	@Override
	public int deletePayment(String index) throws DataAccessException {
		int result = sqlSession.delete("mapper.payment.deletePayment", index);
		return result;
	}
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}
}