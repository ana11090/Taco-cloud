package sia.tacocloud;

import sia.tacocloud.Ingredient;
public interface IngredientRepository {
    Iterable<Ingredient> findAll();
    Ingredient findOne(String id);
    Ingredient save(Ingredient ingredient);
}