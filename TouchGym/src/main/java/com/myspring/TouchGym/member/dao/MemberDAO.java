package com.myspring.TouchGym.member.dao;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;




public interface MemberDAO {
	 public List selectChosenMember(String id) throws DataAccessException;
	 public List selectChosenPayment(String id) throws DataAccessException;
	 public List selectAllMemberList() throws DataAccessException;
	 public List selectIdList() throws DataAccessException;
	 public List selectChosenMemberList(String id) throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int modMember(MemberVO memberVO) throws DataAccessException ;
	 public int modDate(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String id) throws DataAccessException;
	 public int deletePayment(String id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public int insertLogin(String id) throws DataAccessException;
	 public List getLogin(String id) throws DataAccessException;
	 public List loginToday() throws DataAccessException;
	 public List lockerInfo() throws DataAccessException;
	 public int modLocker(LockerVO lockerVO) throws DataAccessException ;
	 public int insertPayment(PaymentVO paymentVO) throws DataAccessException ;
}