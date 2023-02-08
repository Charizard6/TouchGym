package com.myspring.TouchGym.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.TouchGym.member.dao.MemberDAO;
import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl  implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List loginToday() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.loginToday();
		return membersList;
	}
	@Override
	public List lockerInfo() throws DataAccessException {
		List lockersList = null;
		lockersList = memberDAO.lockerInfo();
		return lockersList;
	}
	@Override
	public int modLocker(LockerVO locker) throws DataAccessException {
		return memberDAO.modLocker(locker);
	}
	@Override
	public int insertLogin(String id) throws DataAccessException{
		return memberDAO.insertLogin(id);
	}
	
	@Override
	public int modMember(MemberVO member) throws DataAccessException {
		return memberDAO.modMember(member);
	}
	@Override
	public int modDate(MemberVO member) throws DataAccessException {
		return memberDAO.modDate(member);
	}
	@Override
	public List choosePayment(String id) throws DataAccessException{
		List payment = null;
		payment = memberDAO.selectChosenPayment(id);
		return payment;
	}
	@Override
	public int addPayment(PaymentVO payment) throws DataAccessException {
		return memberDAO.insertPayment(payment);
	}
	@Override
	public List chooseMember(String id) throws DataAccessException {
		List member = null;
		member = memberDAO.selectChosenMember(id);
		return member;
	}
	
	@Override
	public List listChosenMembers(String id) throws DataAccessException{
		List memberList = null;
		memberList = memberDAO.selectChosenMemberList(id);
		return memberList;
	}

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public List listId() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectIdList();
		return membersList;
	}
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	@Override
	public int removePayment(String index) throws DataAccessException {
		return memberDAO.deletePayment(index);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	@Override
	public List getLogin(String id) throws DataAccessException{
		List membersList = null;
		membersList = memberDAO.getLogin(id);
		return membersList;
	}
}