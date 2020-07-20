package com.nikhil.courses;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseService {
	
	@Autowired
	private CourseRepository courseRepository;
	
//	private List<Course> topics = new ArrayList<>( Arrays.asList(
//		new Course("spring","Spring framework","about Spring Framework"),
//		new Course("python","python","about python"),
//		new Course("springmvc","Springmvc framework","about Springmvc Framework")
//		)); 
	
	public List<Course> getAllCourses(String topicId){
		//return topics;
		List<Course> courses = new ArrayList<>();
		courseRepository.findByTopicId(topicId)
		.forEach(courses::add);
		return courses;
	}
	
	public Course getCourse(String id) {
		//return topics.stream().filter(topic -> topic.getId().equals(id)).findFirst().get();
		return courseRepository.findById(id).orElse(null);
	}

	public void addCourse(Course course) {
		//topics.add(topic);
		courseRepository.save(course);
	}

	public void updateCourse(Course course) {
//		for(int i = 0; i < topics.size(); i++) {
//			Topic t = topics.get(i);
//			if(t.getId().equals(id)) {
//				topics.set(i, topic);
//				return;
//			}	
//		}
		
		courseRepository.save(course);
	}

	public void deleteCourse(String id) {
		//topics.removeIf(t -> t.getId().equals(id));
		courseRepository.deleteById(id);
	}
	
}
