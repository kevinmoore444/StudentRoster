package com.codingdojo.student.roster.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.student.roster.models.Dorm;
import com.codingdojo.student.roster.models.Student;
import com.codingdojo.student.roster.services.DormService;
import com.codingdojo.student.roster.services.StudentService;

@Controller
public class MainController {

	//Instantiate the Service Files
	@Autowired
	private DormService dormService;
	
	@Autowired 
	private StudentService studentService;
	
	//Display Dash-board
	@GetMapping("/dorms")
	public String dormDashboard(Model model) {
		List<Dorm> dormList = dormService.allDorms();
		model.addAttribute("dormList", dormList);
		return "dashboard.jsp";
	}
	
	
	//Display New Dormitory Form
	@GetMapping("/dorms/new")
	public String newDormForm(@ModelAttribute("newDorm") Dorm newDorm) {
		return "newDorm.jsp";
	}
	
	//Process the New Dormitory Form
	@PostMapping("/dorms/new")
	public String processDormForm(
		@Valid @ModelAttribute("newDorm") Dorm newDorm, BindingResult result){
		if(result.hasErrors()) {
			return "newDorm.jsp";
		}
		else {
			dormService.createDorm(newDorm);
			return "redirect:/dorms";
		}
	}
	
	
	//Display the New Student form
	@GetMapping("/students/new")
	public String newStudentForm(@ModelAttribute("newStudent") Student newstudent, Model model){
		List<Dorm> dormList = dormService.allDorms();
		model.addAttribute("dormList", dormList);
		return "newStudent.jsp";
	}
	
	//Process the New Student form
	@PostMapping("/students/new")
	public String processStudentForm(@Valid @ModelAttribute("newStudent") Student newStudent, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "newStudent.jsp";
		}
		else {
			studentService.createStudent(newStudent);
			return "redirect:/dorms";
		}
	}
	
	
	
	//View One Dormitory
	@GetMapping("/dorms/{id}")
	public String oneDorm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dorm", dormService.oneDorm(id));
		List<Student> studentList = studentService.allStudents();
		model.addAttribute("studentList", studentList);
		return "dormDetails.jsp";
	}
	
	
	
	//ReAssign Student to Dormitory
	@PutMapping("/students/edit/{id}")
	public String updateDorm(@RequestParam("student") Long studentId, @PathVariable("id") Long dormId) {
		Student student = studentService.oneStudent(studentId);
		Dorm dorm = dormService.oneDorm(dormId);
		studentService.updateStudent(student, dorm);
		return "redirect:/dorms/" + dormId;
	}
	
	
	//Delete One Student
	@GetMapping("/students/delete/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		studentService.deleteStudent(id);
		return "redirect:/dorms";
	}
	
	
}
