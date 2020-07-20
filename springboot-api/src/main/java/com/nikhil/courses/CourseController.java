package com.nikhil.courses;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nikhil.topicController.Topic;

@RestController
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value = "/topics/{id}/courses")
	public List<Course> getAllCourses(@PathVariable("id") String id) {
		
		return courseService.getAllCourses(id);
	}
	
	@RequestMapping(value = "/topics/{topicId}/courses/{id}")
	public Course getCourse(@PathVariable("id") String id) {
		return courseService.getCourse(id);
	}
	
	@RequestMapping(value = "/topics/{topicId}/courses", method = RequestMethod.POST)
	public void addCourse(@RequestBody Course course, @PathVariable("topicId") String topicId) {
		course.setTopic(new Topic(topicId, "" ,""));
		courseService.addCourse(course);
		
	}
	
	@RequestMapping(value = "/topics/{topicId}/courses/{id}", method = RequestMethod.PUT)
	public void updateCourse(@RequestBody Course course, @PathVariable("topicId") String topicId, @PathVariable("id") String id) {
		course.setTopic(new Topic(topicId, "" ,""));
		courseService.updateCourse(course);
		
	}
	
	@RequestMapping(value = "/topics/{topicId}/courses/{id}", method = RequestMethod.DELETE)
	public void deleteCourse(@PathVariable("id") String id) {
		courseService.deleteCourse(id);
		
	}
}
