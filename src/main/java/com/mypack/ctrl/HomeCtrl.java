package com.mypack.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypack.dao.TodoDao;
import com.mypack.entity.Todo;
import com.sun.javafx.sg.prism.NGShape.Mode;

@Controller
public class HomeCtrl {
	@Autowired
	ServletContext context;
	@Autowired
	TodoDao todoDao;
	
	@RequestMapping("/home")
	public String home(Model m) {
		String str = "home";
		m.addAttribute("page", str);
		
		List<Todo>list2=this.todoDao.getAll();
		m.addAttribute("todos", list2);
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
		Todo t=new Todo();
		m.addAttribute("todo", t); 
		m.addAttribute("page", "add");
		return "home";
	}
	
	@RequestMapping(value="/saveTodo",method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model m)
	{
		t.setTodoDate(new Date());
		System.out.println(t);
		this.todoDao.save(t);
		m.addAttribute("msg", " Added Sucessfully...");
		return "home";
		//Adding new Code
	}
}
