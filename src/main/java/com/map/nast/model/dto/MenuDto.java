package com.map.nast.model.dto;

import com.map.nast.model.entity.ItemDescription;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDto {
    private String name;
    private ItemDescription itemDescription;
}
