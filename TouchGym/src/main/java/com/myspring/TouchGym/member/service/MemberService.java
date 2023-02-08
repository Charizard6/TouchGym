package com.myspring.TouchGym.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;



public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public List listId() throws DataAccessException;
	 public List listChosenMembers(String id) throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int modMember(MemberVO memberVO) throws DataAccessException;
	 public int modDate(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public int removePayment(String index) throws DataAccessException;
	 public List chooseMember(String id) throws DataAccessException;
	 public List choosePayment(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 public List getLogin(String id) throws DataAccessException;
	 public int insertLogin(String id) throws DataAccessException;
	 public List loginToday() throws DataAccessException;
	 public List lockerInfo() throws DataAccessException;
	 public int modLocker(LockerVO lockerVO) throws DataAccessException;
	 public int addPayment(PaymentVO paymentVO) throws DataAccessException;
}