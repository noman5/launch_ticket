/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.noman.launcheticket.controller;

import com.noman.launcheticket.dao.FareChartService;
import com.noman.launcheticket.dao.LaunchinfoService;
import com.noman.launcheticket.dao.PaymentService;
import com.noman.launcheticket.dao.ReservationDetailsService;
import com.noman.launcheticket.dao.ReservationService;
import com.noman.launcheticket.model.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author noman
 */
@Controller
public class PaymentController {

    @Autowired
    PaymentService paysd;
    @Autowired
    ReservationService rss;
    @Autowired
    LaunchinfoService lns;
    @Autowired
    ReservationDetailsService resdetdao;
    @Autowired
    FareChartService fcsdao;

    @RequestMapping("/showcartpage")
    public ModelAndView paymentpage() {
        String paymentlist = paysd.viewPayment();
        String traininforlist = lns.viewLaunch();
        String reservationlist = rss.viewLaunchReservation();
        String reservationdetails = resdetdao.viewReservationDetails();
        String farecharlist = fcsdao.viewFareChart();

        ModelAndView mv = new ModelAndView("paymentticket", "paymentforticketp", new Payment());

        mv.addObject("paymentlist", paymentlist);
        mv.addObject("traininforlist", traininforlist);
        mv.addObject("reservationlist", reservationlist);
        mv.addObject("reservationdetails", reservationdetails);
        mv.addObject("farecharlist", farecharlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addpayment", params = "AddPay")
    public String addpayment(@ModelAttribute("paymentforticketp") Payment pi) {
        pi.setTotal(pi.getQty() * pi.getFareamt());
        paysd.insertPayment(pi);

        return "redirect:/showcartpage";
    }

}
