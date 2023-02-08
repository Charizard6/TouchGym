package com.myspring.TouchGym.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.TouchGym.member.service.MemberService;
import com.myspring.TouchGym.member.vo.LockerVO;
import com.myspring.TouchGym.member.vo.MemberVO;
import com.myspring.TouchGym.member.vo.PaymentVO;

@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl   implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO ;
	@Autowired
	private MemberVO loginVO;
	
	@Override
	@RequestMapping(value="/member/loginToday.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView loginToday(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List membersList = memberService.loginToday();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		System.out.println(membersList.toString()+"로그인투데이");
		return mav;	
	}
	@Override
	@RequestMapping(value="/member/locker.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView lockerInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List lockersList = memberService.lockerInfo();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lockersList", lockersList);
		System.out.println(lockersList.toString()+"락커투데잉");
		return mav;	
	}
	@Override
	@RequestMapping(value="/member/lockerPage.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView lockerPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List lockersList = memberService.lockerInfo();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lockersList", lockersList);
		System.out.println(lockersList.toString()+"락커투데잉");
		return mav;	
	}
	@Override
	@RequestMapping(value="/member/sendLocker.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView modLocker(@ModelAttribute("member") LockerVO locker,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		String id = locker.getlockerMember();
		result = memberService.modLocker(locker);
		ModelAndView mav = new ModelAndView("redirect:/member/theChosenOne.do?id="+id);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/modMember.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView modMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		System.out.println(member.toString());
		String id = member.getId();
		result = memberService.modMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/theChosenOne.do?id="+id);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/theChosenOne.do" ,method = RequestMethod.GET)
	public ModelAndView chooseMember(@RequestParam("id") String id, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		List membersList = memberService.chooseMember(id);
		List paymentList = memberService.choosePayment(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		mav.addObject("paymentList", paymentList);
		return mav;
	}
	@Override
	@RequestMapping(value="/member/memberpom.do" ,method = RequestMethod.GET)
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List membersList = memberService.listId();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		System.out.println(membersList.toString());
		return mav;	
	}
	@Override
	@RequestMapping(value="/member/paymentPage.do" ,method = RequestMethod.GET)
	public ModelAndView paymentPage(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List memberList = memberService.chooseMember(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("memberList",memberList);
		System.out.println(id+"출력되니");
		return mav;	
	}
	@Override
	@RequestMapping(value="/member/paymentPage2.do" ,method = RequestMethod.POST)
	public ModelAndView addPayment(@ModelAttribute("payment") PaymentVO payment, @ModelAttribute("mem") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addPayment(payment);
		result = memberService.modDate(member);
		String id = payment.getpID().toString();
		ModelAndView mav = new ModelAndView("redirect:/member/theChosenOne.do?id="+id);
		return mav;
	}
	
	/*@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listId();
		ModelAndView mav = new ModelAndView();
		mav.addObject("membersList", membersList);
		mav.setViewName(viewName);
		System.out.println(membersList.toString());
		return mav;
	}*/
	
	@Override
	@RequestMapping(value="/member/searchMember.do",method = RequestMethod.GET)
	public ModelAndView goToSearchBox(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/listChosenMembers.do",method = RequestMethod.GET)
	public ModelAndView listChosenMembers(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		List memberList = memberService.listChosenMembers(id);
		
		System.out.println(id);
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
//		String viewName = (String)request.getAttribute("viewName");
		//System.out.println("viewName: " +viewName);
		logger.info("viewName: "+ viewName);
		logger.debug("viewName: "+ viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		System.out.println(membersList.toString());
		return mav;	
	}

	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		String id = member.getId().toString();
		ModelAndView mav = new ModelAndView("redirect:/member/theChosenOne.do?id="+id);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	@Override
	@RequestMapping(value="/member/removePayment.do" ,method = RequestMethod.GET)
	public ModelAndView removePayment(@RequestParam("pindex") String pindex, @RequestParam("id") String id,
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removePayment(pindex);
		ModelAndView mav = new ModelAndView("redirect:/member/theChosenOne.do?id="+id);
		return mav;
	}
	
	@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)
//	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		memberService.insertLogin(id);
		ModelAndView mav = new ModelAndView("redirect:/member/loginInfo.do?id="+id);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/loginInfo.do", method = RequestMethod.GET)
	public ModelAndView loginInfo(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		List memberList = memberService.getLogin(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", memberList);
		System.out.println(id+"값넝ㅂ엉ㅇ");
		return mav;
	}
	//@Override
	//@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	/*public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/listMembers.do");
		return mav;
	}*/	

	
	

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}


}