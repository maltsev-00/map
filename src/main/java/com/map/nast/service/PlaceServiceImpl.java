package com.map.nast.service;

import com.map.nast.config.properties.MapCoordinate;
import com.map.nast.model.entity.Place;
import com.map.nast.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PlaceServiceImpl implements PlaceService {

    private final PlaceRepository placeRepository;
    private final MenuItemService menuItemService;
    private final MapCoordinate mapCoordinate;

    @Override
    public List<Place> getPlaceList() {
        return placeRepository.findAll();
    }

    @Override
    public List<Place> sortPlaceList() {
        return placeRepository.findAllByOrderByRaitingDesc();
    }

    @Override
    public List<Place> findByName(String name) {
        return menuItemService.getListPlace(name);
    }

    @Override
    public List<Place> getPlaceListNear() {
        return placeRepository.findAllByHeightLessThanAndWidthLessThan(mapCoordinate.getX(), mapCoordinate.getY())
                .stream()
                .limit(10)
                .collect(Collectors.toList());
    }

    @Override
    public void saveLikeRestaurant(Long id) {
        Place place = placeRepository.getById(id);
        place.setFavorite(true);
        placeRepository.save(place);
    }

    @Override
    public void deleteLikeRestaurant(Long id) {
        Place place = placeRepository.getById(id);
        place.setFavorite(false);
        placeRepository.save(place);
    }

    @Override
    public List<Place> getFavouriteRestrauntList() {
        return placeRepository.findAllByFavorite(true);
    }
}
