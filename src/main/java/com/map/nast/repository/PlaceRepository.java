package com.map.nast.repository;

import com.map.nast.model.entity.Place;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {

    List<Place> findAllByOrderByRaitingDesc();

    List<Place> findAllByHeightLessThanAndWidthLessThan(Double x, Double y);

    List<Place> findAllByFavorite(boolean favourite);
}
