package com.map.nast.service;

import com.map.nast.model.entity.MenuItem;
import com.map.nast.model.entity.Place;
import com.map.nast.repository.MenuItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuItemServiceImpl implements MenuItemService {

    private final MenuItemRepository menuItemRepository;
    private final ItemIngredientService itemIngredientService;

    @Override
    public List<Place> getListPlace(String name) {
        List<MenuItem> menuItems = menuItemRepository.findMenuItemByNameIgnoreCaseContainingOrPlaceNameIgnoreCaseContaining(name, name);
        menuItems.addAll(getListPlaceByNameIngredient(name));
        List<Place> places = new ArrayList<>();
        menuItems.forEach(menuItem -> places.add(menuItem.getPlace()));
        return places;
    }

    private List<MenuItem> getListPlaceByNameIngredient(String name) {
        return menuItemRepository.findMenuItemByItemDescriptionItemIngredientIdIn(itemIngredientService.getIdListItemIngredient(name));
    }
}
