package com.map.nast.repository;

import com.map.nast.model.entity.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuItemRepository extends JpaRepository<MenuItem,Long> {
    List<MenuItem> findMenuItemByNameIgnoreCaseContainingOrPlaceNameIgnoreCaseContaining(String name,String name1);
    List<MenuItem> findMenuItemByItemDescriptionItemIngredientIdIn(List<Long> idList);


    List<MenuItem> findMenuById(Long name);
}
