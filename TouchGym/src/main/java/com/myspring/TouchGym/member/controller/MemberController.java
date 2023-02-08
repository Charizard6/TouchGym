package com.myspring.TouchGym.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;


public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goToSearchBox(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removePayment(@RequestParam("index") String index,@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView login(@ModelAttribute("member") MemberVO member,RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listChosenMembers(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView chooseMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView login(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView loginInfo(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView loginToday(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView lockerInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView lockerPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modLocker(@ModelAttribute("info") LockerVO lockerVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView paymentPage(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addPayment(@ModelAttribute("info") PaymentVO paymentVO,@ModelAttribute("mem") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
}