package com.map.nast.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Place {
    @Id
    private Long id;
    private String name;
    private String address;
    private float raiting;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_place_id")
    private TypePlace typePlace;
    private Double height;
    private Double width;
    private Boolean favorite = false;
}
