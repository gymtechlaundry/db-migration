package space.devincoopers.db_migration;

import org.flywaydb.core.Flyway;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DbMigrationApplication {

	public static void main(String[] args) {
		if (args.length > 0 && "repair".equalsIgnoreCase(args[0])) {
			Flyway flyway = Flyway.configure()
					.dataSource(System.getenv("SPRING_DATASOURCE_URL"),
							System.getenv("SPRING_DATASOURCE_USERNAME"),
							System.getenv("SPRING_DATASOURCE_PASSWORD"))
					.load();
			flyway.repair();
			System.out.println("✅ Flyway repair completed.");
		} else {
			SpringApplication.run(DbMigrationApplication.class, args);
		}
	}
}
