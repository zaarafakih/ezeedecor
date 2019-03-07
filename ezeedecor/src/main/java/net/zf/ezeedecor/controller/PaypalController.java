package net.zf.ezeedecor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.zf.ezeedecor.service.CartService;

@Controller
@RequestMapping(value="/checkout")
public class PaypalController {

	@Autowired
	private CartService cartService;
	
	
	
	@RequestMapping(value="/requestTransaction",method=RequestMethod.GET)
	public ModelAndView checkout(){
		ModelAndView mv=new ModelAndView("checkout");
		mv.addObject("title","Checkout");
		mv.addObject("userClickCheckout","true");
		
		mv.addObject("cartLines",cartService.getCartLines());
		
		return mv;
	}
	
	/*@RequestMapping(value="/callback",method=RequestMethod.GET)
	public ModelAndView success(ModelMap modelMap,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("page");
		PaypalSuccess ps=new PaypalSuccess();
		
		modelMap.put("result",ps.getPayPal(request));
		mv.addObject("title","Transaction Success !");
		mv.addObject("userClickCallback",true);
		String response= cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;

		return mv;
	}*/
	
	@RequestMapping(value="/callback",method=RequestMethod.GET)
	public ModelAndView success(){
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("title","Transaction Success !");
		mv.addObject("userClickCallback",true);
		
		//cart cartt=userModel.getCart();
		 //String outcome=cartService.resetCart(cartt);
		//mv.addObject("outcome",outcome);
		

		return mv;
	}
	
	
	
	
}
