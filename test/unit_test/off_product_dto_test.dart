import 'package:flutter_test/flutter_test.dart';
import 'package:opennutritracker/core/utils/supported_language.dart';
import 'package:opennutritracker/features/add_meal/data/dto/off/off_product_dto.dart';
import 'package:opennutritracker/features/add_meal/data/dto/off/off_product_nutriments_dto.dart';

void main() {
  group('OFFProductDTO getLocaleName', () {
    test('should return product_name_English when language is English', () {
      // Arrange
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Name - testValue',
        product_name_en: 'English Name - testValue',
        product_name_fr: 'Nom Français - testValue',
        product_name_de: 'Deutscher Name - testValue',
        brands: 'Brand - testValue',
        image_front_thumb_url: 'thumb - testValue',
        image_front_url: 'front - testValue',
        image_ingredients_url: 'ingredients - testValue',
        image_nutrition_url: 'nutrition - testValue',
        image_url: 'image - testValue',
        url: 'url - testValue',
        quantity: '100g - testValue',
        product_quantity: '100 - testValue',
        serving_quantity: '50 - testValue',
        serving_size: '50g - testValue',
        nutriments: OFFProductNutrimentsDTO(
          energy_kcal_100g: 1,
          carbohydrates_100g: 1,
          fat_100g: 1,
          proteins_100g: 1,
          sugars_100g: 1,
          saturated_fat_100g: 1,
          fiber_100g: 1,
        ),
      );

      // Act
      final result = product.getLocaleName(SupportedLanguage.en);

      // Assert
      expect(result, equals('English Name - testValue'));
    });

    test('should return product_name_Deutscher when language is German', () {
      // Arrange
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Name - testValue',
        product_name_en: 'English Name - testValue',
        product_name_fr: 'Nom Français - testValue',
        product_name_de: 'Deutscher Name - testValue',
        brands: 'Brand - testValue',
        image_front_thumb_url: 'thumb - testValue',
        image_front_url: 'front - testValue',
        image_ingredients_url: 'ingredients - testValue',
        image_nutrition_url: 'nutrition - testValue',
        image_url: 'image - testValue',
        url: 'url - testValue',
        quantity: '100g - testValue',
        product_quantity: '100 - testValue',
        serving_quantity: '50 - testValue',
        serving_size: '50g - testValue',
        nutriments: OFFProductNutrimentsDTO(
          energy_kcal_100g: 1,
          carbohydrates_100g: 1,
          fat_100g: 1,
          proteins_100g: 1,
          sugars_100g: 1,
          saturated_fat_100g: 1,
          fiber_100g: 1
        ),
      );

      // Act
      final result = product.getLocaleName(SupportedLanguage.de);

      // Assert
      expect(result, equals('Deutscher Name - testValue'));
    });

    test('should return product_name_Deutscher when language is German', () {
      // Arrange
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Name - testValue',
        product_name_en: 'English Name - testValue',
        product_name_fr: 'Nom Français - testValue',
        product_name_de: 'Deutscher Name - testValue',
        brands: 'Brand - testValue',
        image_front_thumb_url: 'thumb - testValue',
        image_front_url: 'front - testValue',
        image_ingredients_url: 'ingredients - testValue',
        image_nutrition_url: 'nutrition - testValue',
        image_url: 'image - testValue',
        url: 'url - testValue',
        quantity: '100g - testValue',
        product_quantity: '100 - testValue',
        serving_quantity: '50 - testValue',
        serving_size: '50g - testValue',
        nutriments: OFFProductNutrimentsDTO(
          energy_kcal_100g: 1,
          carbohydrates_100g: 1,
          fat_100g: 1,
          proteins_100g: 1,
          sugars_100g: 1,
          saturated_fat_100g: 1,
          fiber_100g: 1
        ),
      );

      // Act
      final result = product.getLocaleName(SupportedLanguage.de);

      // Assert
      expect(result, equals('Deutscher Name - testValue'));
    });
  });
} 