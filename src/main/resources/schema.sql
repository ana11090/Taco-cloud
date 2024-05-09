import sia.tacocloud.Ingredient;
import sia.tacocloud.IngredientRepository;
import sia.tacocloud.Taco;
import sia.tacocloud.TacoRepository;
import sia.tacocloud.data.JdbcIngredientRepository;
import sia.tacocloud.data.JdbcTacoRepository;

// IngredientRepository interface
public interface IngredientRepository {
    Ingredient findOne(String id);
    Ingredient save(Ingredient ingredient);
}

// JdbcIngredientRepository implementation
public class JdbcIngredientRepository implements IngredientRepository {
    private JdbcTemplate jdbc;

public JdbcIngredientRepository(DataSource dataSource) {
        this.jdbc = new JdbcTemplate(dataSource);
}

    @Override
    public Ingredient findOne(String id) {
        return jdbc.queryForObject(
                "select id, name, type from Ingredient where id=?",
                (rs, rowNum) -> new Ingredient(
                        rs.getString("id"),
                        rs.getString("name"),
                        Ingredient.Type.valueOf(rs.getString("type"))
                ),
                id
        );
}

    @Override
    public Ingredient save(Ingredient ingredient) {
        if (ingredient.getId() == null) {
            this.jdbc.update(
                    "insert into Ingredient (id, name, type) values (?, ?, ?)",
                    ingredient.getId(),
                    ingredient.getName(),
                    ingredient.getType().getLookup()
            );
} else {
            this.jdbc.update(
                    "update Ingredient set name=?, type=? where id=?",
                    ingredient.getName(),
                    ingredient.getType().getLookup(),
                    ingredient.getId()
            );
}
        return ingredient;
}
}

// TacoRepository interface
public interface TacoRepository {
    Taco save(Taco taco);
}

// JdbcTacoRepository implementation
public class JdbcTacoRepository implements TacoRepository {
    private JdbcTemplate jdbc;

public JdbcTacoRepository(DataSource dataSource) {
        this.jdbc = new JdbcTemplate(dataSource);
}

    @Override
    public Taco save(Taco taco) {
        long tacoId = saveTacoInfo(taco);
        taco.setId(tacoId);
for (Ingredient ingredient : taco.getIngredients()) {
            saveIngredientToTaco(ingredient, tacoId);
}
        return taco;
}

    private long saveTacoInfo(Taco taco) {
        String tacoName = taco.getName();
        long createdAt = System.currentTimeMillis();
        this.jdbc.update(
                "insert into Taco (name, createdAt) values (?, ?)",
                tacoName,
                createdAt
        );
return this.jdbc.queryForObject(
        "select last_insert_id()",
        Long.class
       );
}

    private void saveIngredientToTaco(Ingredient ingredient, long tacoId) {
        this.jdbc.update(
                "insert into Taco_Ingredients (taco, ingredient) values (?, ?)",
                tacoId,
                ingredient.getId()
        );
}
}

// Ingredient class
public class Ingredient {
    private String id;
    private String name;
    private Type type;

// constructors, getters, and setters
}

// Taco class
public class Taco {
    private Long id;
    private String name;

    private Date createdAt;
    private List<Ingredient> ingredients;

// constructors, getters, and setters
}


// Type enum
public enum Type {
    WRAP, PRO}
