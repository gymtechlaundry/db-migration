package space.devincoopers.db_migration;

import org.flywaydb.core.Flyway;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DbMigrationApplication {

	public static void main(String[] args) {
		SpringApplication.run(DbMigrationApplication.class, args);
	}

	@Bean
	CommandLineRunner runMigration(Flyway flyway) {
		return args -> {
			System.out.println("✅ Flyway bean loaded. Running migration manually...");
			flyway.migrate(); // force the migration
		};
	}

}
