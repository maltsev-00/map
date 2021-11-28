package com.map.nast.service;

import com.map.nast.model.entity.Ingredient;
import com.map.nast.repository.ItemIngredientRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemIngredientServiceImpl implements ItemIngredientService {

    private final ItemIngredientRepository itemIngredientRepository;

    @Override
    public List<Long> getIdListItemIngredient(String name) {
        List<Ingredient> ingredientList = itemIngredientRepository.findIngredientByNameIgnoreCaseContaining(name);
        List<Long> listId = new ArrayList<>();
        ingredientList.forEach(ingredient -> listId.add(ingredient.getItemDescription().getId()));
        return listId;
    }
}
