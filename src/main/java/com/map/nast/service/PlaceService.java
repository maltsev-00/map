package com.map.nast.service;

import com.map.nast.model.entity.Place;

import java.util.List;

public interface PlaceService {
    List<Place> getPlaceList();

    List<Place> sortPlaceList();

    List<Place> findByName(String name);

    List<Place> getPlaceListNear();

    void saveLikeRestaurant(Long id);

    void deleteLikeRestaurant(Long id);

    List<Place> getFavouriteRestrauntList();
}
