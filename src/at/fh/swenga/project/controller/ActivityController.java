package at.fh.swenga.project.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import at.fh.swenga.project.dao.ActivityRepository;
import at.fh.swenga.project.dao.CategoryRepository;
import at.fh.swenga.project.dao.SubcategoryRepository;
import at.fh.swenga.project.data.Categories;
import at.fh.swenga.project.data.Games;
import at.fh.swenga.project.data.Sports;
import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.Subcategory;

@Controller
public class ActivityController {
	String lastcategory; 
	boolean categoriesCreated = false; 
	
	@Autowired
	ActivityRepository activityRepository;
	
	@Autowired
	SubcategoryRepository subcategoryRepository;
	
	@Autowired
	CategoryRepository categoryReposiory;
	
	@RequestMapping(value = { "/" })
	public String index(Model model){	
		//if(!categoriesCreated) subcategoryRepository.save(Categories.FillCategories()); //Erstellen aller Catergories + Subcategories
		categoriesCreated = true;
	
		return "index";
	}
	
	@RequestMapping(value = "/listActivities") 
	public String list(Model model, @RequestParam(required=false) String category) {
		if(category==null) category = lastcategory;
		lastcategory = category;
	
		List<Activity> activities = (List<Activity>) model.asMap().get("activities");
		List<Integer> activitiesInt = new ArrayList<>();
		if(activities!=null) {
			for(Activity a : activities) { activitiesInt.add(a.getId()); }
		}
		
		List<Subcategory> subcategories = subcategoryRepository.findByCategoryName(category);
		if(activities==null) activities = activityRepository.getCatActivities(category); // Falls keine Activties �bergeben wurden (also keine herausgefiltert wurden)
		else activities = activityRepository.getFilteredActivities(category, activitiesInt);
		
		model.addAttribute("activities", activities);
		model.addAttribute("subcategories", subcategories);
		model.addAttribute("type", "findAll");
		return "listActivities";
	}

	
	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam(required=false) String searchString, @RequestParam String type, RedirectAttributes redirectAttributes) { // TODO: Es werden alle passenden angezeigt nicht nur die der jeweiligen Categorie-Liste
		List<Activity> activities = null;
		if(searchString==null) type="default"; //Falls kein Filter ausgew�hlt wurde, werden alle ausgegeben
		
		switch (type) {
		case "findTitle":
			activities = activityRepository.findByTitleContainingAllIgnoreCase(searchString);
			break;
		case "findSubcategory":
			activities = activityRepository.findBySubcategoryNameContainingAllIgnoreCase(searchString);
			break;
		case "findState":
			activities = activityRepository.findByState(searchString);
			break;
		case "findLocation":
			activities = activityRepository.findByLocationContainingAllIgnoreCase(searchString);
			break;
							
		default:
			activities = activityRepository.findAll();
		}
		redirectAttributes.addFlashAttribute("activities", activities);
		
		return "redirect:listActivities";
	}
	
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {
		
		
		Activity a = new Activity(subcategoryRepository.findByName("Soccer"), "Graz", "Steiermark", "Test", "TestText", 1);
		activityRepository.save(a);
		
		Activity c = new Activity(subcategoryRepository.findByName("Tennis"), "Wien", "Wien", "ka", "KaText", 1);
		activityRepository.save(c);
		
		Activity b = new Activity(subcategoryRepository.findByName("Counter Strike"), "Graz","Steiermark", "Test", "TestText", 1);
		activityRepository.save(b);
	
		
		return "forward:listActivities";
	}
	
	@RequestMapping("/addActivity")
	public String addActivity(Model model) {
		
		List<Subcategory> sub = subcategoryRepository.findAll(); // TODO: Nur die richtigen Anzeigen
		model.addAttribute("subcategories", sub);
		return "addActivities";
	}
		
	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text, @RequestParam String state, @RequestParam String location, @RequestParam int restriction, @RequestParam String type  ) {
		Subcategory s = subcategoryRepository.findByName(type); 
		Activity a = new Activity(s, location ,state, title, text, restriction);
		activityRepository.save(a);
		
		return "forward:listActivities";
	}

	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		activityRepository.delete(id);

		return "forward:listActivities";
	}

	//@ExceptionHandler(Exception.class) TODO: Wieder aktivieren nach fertigstellung
	public String handleAllException(Exception ex) {
		return "showError";
	}
	
	
}
