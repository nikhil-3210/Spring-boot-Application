package com.nikhil.studentController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nikhil.topicController.Topic;

@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;
	
	public List<Student> getAllStudents() {
		List<Student> student = new ArrayList<>();
		studentRepository.findAll().forEach(student::add);
		return student;
	}

	public void saveStudentObj(Student student) {

		studentRepository.save(student);
	}

	public void deleteStudentObj(Student student) {

		studentRepository.delete(student);
	}

	public Student getStudentObjById(Integer studentId) {

		 return (Student) studentRepository.findById(studentId).get();
	}
}
