package com.map.nast.repository;

import com.map.nast.model.entity.Ingredient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemIngredientRepository extends JpaRepository<Ingredient,Long> {
    List<Ingredient> findIngredientByNameIgnoreCaseContaining(String name);
}
