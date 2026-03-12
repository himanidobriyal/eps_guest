
package com.ireps.admin.itemmaster.controller;

import com.ireps.admin.itemmaster.dao.ApprovingAgencyDao;
import com.ireps.admin.itemmaster.dao.ItemDepartmentDao;
import com.ireps.admin.itemmaster.dao.SubDirectorateDao;
import com.ireps.admin.itemmaster.model.ItemRecord;
import com.ireps.admin.itemmaster.model.SubDirectorate;
import com.ireps.admin.itemmaster.service.ItemService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/eps/itemmaster")
public class ItemMasterController {

	private final ApprovingAgencyDao approvingAgencyDao;
	private final ItemDepartmentDao departmentDao;
	private final SubDirectorateDao subDirectorateDao;
	private final ItemService itemService;

	public ItemMasterController(ApprovingAgencyDao  approvingAgencyDao, ItemDepartmentDao departmentDao,
			SubDirectorateDao subDirectorateDao, ItemService itemService) {
		this.approvingAgencyDao = approvingAgencyDao;
		this.departmentDao = departmentDao;
		this.subDirectorateDao = subDirectorateDao;
		this.itemService = itemService;
	}

	// GET → Show item master page with dropdowns
	@GetMapping("/manage.do")
	public String showItemMasterForm(Model model) {
		model.addAttribute("approvingAgencies", approvingAgencyDao.getApprovingAgencies());
		model.addAttribute("departments", departmentDao.getDepartments());
		return "itemmaster";
// JSP file path
	}

	// GET → Fetch sub-directorates dynamically
	@GetMapping("/getSubDirectorates")
	@ResponseBody
	public List<SubDirectorate> getSubDirectorates(@RequestParam String orgZone, // Approving Agency
			@RequestParam String rlyDept) { // Department

		String orgCode = "01"; // Fixed for Indian Railways
		return subDirectorateDao.getSubDirectorates(orgCode, orgZone, rlyDept);
	}
 
	// GET → Fetch items with filters and pagination
	@GetMapping("/items")
	@ResponseBody
	public Map<String, Object> getItems(@RequestParam(required = false) String orgZone,
			@RequestParam(required = false) String rlyDept, @RequestParam(required = false) String subId,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size) {

		Map<String, Object> response = new HashMap<>();
		List<ItemRecord> items = itemService.getItems(orgZone, rlyDept, subId, page, size);
		int total = itemService.getItemsCount(orgZone, rlyDept, subId);

		response.put("data", items);
		response.put("total", total);
		response.put("page", page);
		response.put("size", size);

		return response;
	}
}
