package com.map.nast.service;

import com.map.nast.model.entity.Place;

import java.util.List;

public interface MenuItemService {

    List<Place> getListPlace(String name);

}
