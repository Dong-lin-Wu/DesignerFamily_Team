package tw.designerfamily.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tw.designerfamily.product.model.ProductBean;
import tw.designerfamily.product.model.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService pService;

	
	@RequestMapping
	public String processAction(Model m) {
		List<ProductBean> list = pService.selectAll();
		m.addAttribute("list", list);
		return "product/Product";
	}
	
	@DeleteMapping("/productlist/{id}")
	@ResponseBody
	public void processDelete(@PathVariable("id")int id,Model m) {
		pService.delete(id);
	}
	
	@GetMapping("/productlist/{id}")
	@ResponseBody
	public List<ProductBean> processSearch(@PathVariable("id")String id){
		List<ProductBean> search = pService.findByKeyword(id);
		List<ProductBean> list = pService.selectAll();
		if(id==null || id.equals("")) {
			return list;
		}
		return search;
	}
	
	//轉址
	@GetMapping(path = "/productadd")
	public String processAction7() {
		return"product/ProductAdd";
	}
	
	//後台新增商品
	@PostMapping(path ="/addProduct")
	public String processAction6(@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
	@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
	@RequestParam("commQuantity")int qty,@RequestParam("product_PicBase64")String img) {

	pService.insert(new ProductBean(title, des, spe, catgory, designer, price, qty, img));
	return"redirect:/product";
	}
	
	@GetMapping(path = "/productrevise/{id}")
	public String ProcessAction3(@PathVariable("id") int id,Model m) {
		ProductBean product = pService.selectById(id);
		m.addAttribute("productList", product);
		return"product/ProductUpdate";
	}
	
	@GetMapping("/detail/{id}")
	public String processDetail(@PathVariable("id")int id, Model m) {
		ProductBean p = pService.selectById(id);
		System.out.println(p.getCategory());
		m.addAttribute("p", p);
		return "product/productdetail";
	}
	
	
	@PostMapping(path = "/revisesuccess")
	public String processAction5(@RequestParam("commNo") int id,@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
	@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
	@RequestParam("commQuantity")int qty,@RequestParam("product_PicBase64")String img){
		
    pService.update(new ProductBean(id, title, des, spe, catgory, designer, price, qty, img));
	return "redirect:/product";
	}
	
	//商品detail
		@GetMapping("/{id}")
		public String processCommDetail(@PathVariable("id")int id,Model m) {
			ProductBean comm = pService.selectById(id);
			m.addAttribute("comm", comm);
			return "/product/Comminfo";
		}
		
		@GetMapping("/userAddProduct")
		public String addproduct() {
			return"/product/userProductAdd";
			
		}
		//設計師新增商品
		@PostMapping("/123")
		public String processAction7(@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
		@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
		@RequestParam("commQuantity")int qty,@RequestParam("product_PicBase64")String img) {

		pService.insert(new ProductBean(title, des, spe, catgory, designer, price, qty, img));
		return"redirect:/user";
		}
		
}
