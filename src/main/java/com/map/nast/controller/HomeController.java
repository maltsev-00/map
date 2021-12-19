package com.map.nast.controller;

import com.map.nast.model.dto.PlaceForm;
import com.map.nast.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PlaceService placeService;

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @GetMapping
    public String getAllRestaurant(Model model, PlaceForm placeForm) {
        model.addAttribute("places", placeService.getPlaceList());
        return "home";
    }

    @PostMapping("/find")
    public String findPlace(Model model, PlaceForm placeForm) {
        model.addAttribute("places", placeService.findByName(placeForm.getName()));
        return "home";
    }

    @GetMapping("/sort")
    public String sortAllRestaurant(Model model, PlaceForm placeForm) {
        model.addAttribute("places", placeService.sortPlaceList());
        return "home";
    }

    @GetMapping("/near")
    public String nearRestaurant(Model model, PlaceForm placeForm) {
        model.addAttribute("places", placeService.getPlaceListNear());
        return "home";
    }

    @GetMapping("/like/{id}")
    public String likeRestaurant(@PathVariable("id") Long id, Model model, PlaceForm placeForm) {
        placeService.saveLikeRestaurant(id);
        return "redirect:/";
    }

    @GetMapping("/like/delete/{id}")
    public String deleteLikeRestaurant(@PathVariable("id") Long id, Model model, PlaceForm placeForm) {
        placeService.deleteLikeRestaurant(id);
        return "redirect:/";
    }

    @GetMapping("/favourite")
    public String getFavouriteRestaurantList(Model model, PlaceForm placeForm) {
        model.addAttribute("places", placeService.getFavouriteRestrauntList());
        return "home";
    }

}
