import 'package:flutter_test/flutter_test.dart';
import 'package:opennutritracker/core/utils/supported_language.dart';
import 'package:opennutritracker/features/add_meal/data/dto/off/off_product_dto.dart';
import 'package:opennutritracker/features/add_meal/data/dto/off/off_product_nutriments_dto.dart';

void main() {
  group('OFFProductDTO getLocaleName', () {
    test('Case 1: English Language - Valid Name', () {
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

      final result = product.getLocaleName(SupportedLanguage.en);

      expect(result, equals('English Name - testValue'));
    });

    test('Case 2: Deutscher Language - Valid Name', () {
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Default Name - testValue',
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

      final result = product.getLocaleName(SupportedLanguage.de);

      expect(result, equals('Deutscher Name - testValue'));
    });

    test('Case 3: English Language - Null Name', () {
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Default Name - testValue',
        product_name_en: null,
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

      final result = product.getLocaleName(SupportedLanguage.en);

      expect(
        result == 'Deutscher Name - testValue' ||
        result == 'English Name - testValue' ||
        result == 'Default Name - testValue' ||
        result == 'Nom Français - testValue',
        isTrue,
      );
    });

    test('Case 4: English Language - Empty Name', () {
      final product = OFFProductDTO(
        code: '123 - testValue',
        product_name: 'Default Name - testValue',
        product_name_en: '',
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

      final result = product.getLocaleName(SupportedLanguage.en);

      expect(
        result == 'Deutscher Name - testValue' ||
        result == 'English Name - testValue' ||
        result == 'Default Name - testValue' ||
        result == 'Nom Français - testValue',
        isTrue,
      );
    });
  });
} 