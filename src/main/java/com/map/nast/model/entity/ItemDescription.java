package com.map.nast.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ItemDescription {

    @Id
    private Long id;
    private double price;
    private double weight;
    private String pathImage;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "item_ingredient_id", referencedColumnName = "id")
    private ItemIngredient itemIngredient;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "item_description_id", referencedColumnName = "id")
    private Set<Currency> currencies = new HashSet<>();

}
