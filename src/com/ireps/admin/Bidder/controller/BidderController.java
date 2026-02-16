package com.ireps.admin.Bidder.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ireps.admin.Bidder.dao.BidderDao;
import com.ireps.admin.Bidder.model.BidderForm;
import com.ireps.admin.Bidder.model.Biddermodel;

@Controller
@RequestMapping("/eps/Bidder")
public class BidderController {

	@Autowired
	private BidderDao bidderDao;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping("/bid.do")
	public String showBidPage() {
		return "NewBidder";
	}

	@RequestMapping("/bidderform.do")
	public String newbidderform(Model model) {
		String bidderType = "Registered";
		model.addAttribute("states", bidderDao.getActiveStatesWithIds()); // <-- change
		model.addAttribute("railwayList", bidderDao.getRailwayUnits(bidderType));
		model.addAttribute("bidderForm", new BidderForm());
		return "bidderform";
	}

	// --- AJAX: depots by railway accountId ---
	@GetMapping("/getDepots")
	@ResponseBody
	public List<Biddermodel> getDepots(@RequestParam("accountId") int accountId) {
		return bidderDao.getDepotsByAccountId(accountId);
	}

	// --- AJAX: GST check ---
	@GetMapping("/checkGst")
	@ResponseBody
	public String checkGst(@RequestParam("gstNo") String gstNo) {
		String res = bidderDao.validateGst(gstNo);
		if ("INVALID".equalsIgnoreCase(res))
			return "INVALID";
		if ("AVAILABLE".equalsIgnoreCase(res))
			return "AVAILABLE";
		return res; // account names using this GST
	}

	// --- AJAX: Email check ---
	@GetMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) {
		try {
			int count = jdbcTemplate.queryForObject(
					"SELECT COUNT(*) FROM bv1to1.mr_acct_profile WHERE UPPER(email)=UPPER(?)", Integer.class, email);
			return (count > 0) ? "REGISTERED" : "AVAILABLE";
		} catch (Exception e) {
			return "ERROR";
		}
	}

	// ✅ Handle actual form submission → insert row → redirect to success
	@PostMapping("/register.do")
	public String register(@ModelAttribute("bidderForm") BidderForm form, RedirectAttributes ra, Model model) {
		try {
			long oid = bidderDao.insertBidderOnlineTemp(form);

			// DB se clean copy (trimmed/derived fields) nikaal lo
			BidderForm saved = bidderDao.findTempByOid(oid);

			ra.addFlashAttribute("oid", oid);
			ra.addFlashAttribute("form", saved);
			return "redirect:/eps/Bidder/register.do"; // <-- PRG (redirect)
		} catch (Exception ex) {
			model.addAttribute("error",
					"Registration failed: " + (ex.getMessage() == null ? "Duplicate GST or Email" : ex.getMessage()));

			String bidderType = "Registered";
			model.addAttribute("states", bidderDao.getActiveStatesWithIds());
			model.addAttribute("railwayList", bidderDao.getRailwayUnits(bidderType));
			model.addAttribute("bidderForm", form);
			return "bidderform";
		}
	}

	// ✅ Success page — flash 'form' na mile to OID se DB se laa lo
	@GetMapping("/register.do")
	public String registerSuccess(@ModelAttribute("oid") Long oid, @ModelAttribute("form") BidderForm form,
			@RequestParam(value = "oid", required = false) Long oidParam, Model model) {

		Long finalOid = (oid != null ? oid : oidParam);
		if (form == null && finalOid != null) {
			BidderForm saved = bidderDao.findTempByOid(finalOid);
			model.addAttribute("form", saved);
			model.addAttribute("oid", finalOid);
		} else {
			model.addAttribute("oid", finalOid);
		}
		return "bidderSuccess"; // <-- JSP file ka naam: success.jsp (ya yahan "bidderSuccess" rakhna ho to file
		// rename karo)
	}
}
