package com.nikhil.studentController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/addStudent")
	public String diaplayAddStudentForm(Model model) {
		Student student = new Student();
		model.addAttribute("student", student);
		return "AddStudent";
	}
	
	@RequestMapping(value = "/saveProcess")
	public String saveProcess(@ModelAttribute("student") Student student, Model model) {
		
		studentService.saveStudentObj(student);
		List<Student> listOfStudentsList = studentService.getAllStudents();
		model.addAttribute("theStudents",listOfStudentsList);
		return "ListStudents";
	}
	
	@RequestMapping(value = "/listStudents")
	public String getAllStudents(Model model) {
	
		List<Student> listOfStudentsList = studentService.getAllStudents();
		model.addAttribute("theStudents",listOfStudentsList);
		return "ListStudents";
	}
	
	@RequestMapping(value = "/showUpdateForm")
	public String ShowUpdateForm(@RequestParam("studentId") Integer studentId, Model model) {
		Student student = findById(studentId);
		model.addAttribute("student", student);
		return "AddStudent";
	}
	
	@RequestMapping(value = "/deleteRecord")
	public String deleteStudentObj(@RequestParam("studentId") Integer studentId) {
		Student student = findById(studentId);
		studentService.deleteStudentObj(student);
		return "redirect:/listStudents";
	}
	
	private Student findById(Integer studentId) {
		
		Student student = studentService.getStudentObjById(studentId);
		return student;
	}
}
