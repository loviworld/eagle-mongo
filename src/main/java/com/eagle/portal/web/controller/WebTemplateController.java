package com.eagle.portal.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template")
public class WebTemplateController {

    @RequestMapping("/portal/seller/step-1")
    public String loadNewSellerStepOne() {
        return "portal/seller/step-1";
    }

    @RequestMapping("/portal/seller/step-2")
    public String loadNewSellerStepTwo() {
        return "portal/seller/step-2";
    }

    @RequestMapping("/portal/seller/step-3")
    public String loadNewSellerStepThree() {
        return "portal/seller/step-3";
    }

    @RequestMapping("/portal/seller/step-4")
    public String loadNewSellerStepFour() {
        return "portal/seller/step-4";
    }

    @RequestMapping("/portal/buyer/step-1")
    public String loadNewBuyerStepOne() {
        return "portal/buyer/step-1";
    }

    @RequestMapping("/portal/buyer/individualBuyer")
    public String loadNewBuyerStepTwoIndividualBuyer() {
        return "portal/buyer/step_2_individual_buyer";
    }

    @RequestMapping("/portal/buyer/corporateBuyer")
    public String loadNewBuyerStepTwoCorporateBuyer() {
        return "portal/buyer/step_2_corporate_buyer";
    }
}
