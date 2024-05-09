package sia.tacocloud;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED) // JPA-compatible no-arg constructor
public class Ingredient {
    @Id
    private String id;
    private String name;

    @Enumerated(EnumType.STRING)  // To store enum values as strings
    private Type type;

    public enum Type {
        WRAP, PROTEIN, VEGGIES, CHEESE, SAUCE
    }
}
