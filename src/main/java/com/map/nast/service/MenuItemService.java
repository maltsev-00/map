package com.map.nast.service;

import com.map.nast.model.entity.MenuItem;
import com.map.nast.model.entity.Place;

import java.util.List;
import java.util.Optional;

public interface MenuItemService {

    List<Place> getListPlace(String name);

    List<MenuItem> getMenuByName(String name);
}
