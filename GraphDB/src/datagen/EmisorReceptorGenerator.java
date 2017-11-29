package datagen;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;

/**
 * This class was used to generate the data for the emisorreceptor table.
 */
public class EmisorReceptorGenerator {
	
	private static final String PATH = "../lib/";
	private static final int USER_COUNT = 7500;
	private static final int PHONE_COUNT = 10000;

	public static void main(String[] args) throws IOException {
		Scanner cities = new Scanner(Paths.get(PATH + "cities.csv").toFile());
		Scanner countries = new Scanner(Paths.get(PATH + "countries.csv").toFile());
		Scanner firstNames = new Scanner(Paths.get(PATH + "first_names.csv").toFile());
		Scanner lastNames = new Scanner(Paths.get(PATH + "last_names.csv").toFile());
		Scanner operators = new Scanner(Paths.get(PATH + "operators.csv").toFile());
		
		List<String> countriesList = new ArrayList<>();
		while (countries.hasNextLine()) {
			countriesList.add(countries.nextLine());
		}
		
		List<String> operatorsList = new ArrayList<>();
		while (operators.hasNextLine()) {
			operatorsList.add(operators.nextLine());
		}
		
		
		HashMap<String, String> cityCountries = new HashMap<>();
		
		List<String> citiesList = new ArrayList<>();
		
		while (cities.hasNextLine()) {
			String city = cities.nextLine();
			Collections.shuffle(countriesList);
			cityCountries.put(city, countriesList.get(0));
			citiesList.add(city);
		}
		
		List<String> fstNamesList = new ArrayList<>();
		while (firstNames.hasNextLine()) {
			fstNamesList.add(firstNames.nextLine());
		}
		
		List<String> lastNamesList = new ArrayList<>();
		while (lastNames.hasNextLine()) {
			lastNamesList.add(lastNames.nextLine());
		}
		
		Set<String> users = new HashSet<>();

		while (users.size() < USER_COUNT) {
			Collections.shuffle(fstNamesList);
			Collections.shuffle(lastNamesList);
			users.add(fstNamesList.get(0) + " " + lastNamesList.get(0));
		}
			
		List<String> usersList = new ArrayList<>(users);
		
		
		HashMap<String, String> userCities = new HashMap<>();
		
		for (String user : users) {
			Collections.shuffle(citiesList);
			userCities.put(user, citiesList.get(0));
		}
		
		Set<String> phones = new HashSet<>();
		
		Random rand = new Random();
		while (phones.size() < PHONE_COUNT) {
			int fst = rand.nextInt(900) + 100;
			int snd = rand.nextInt(900) + 100;
			int trd = rand.nextInt(9000) + 1000;
			phones.add(fst + "-" + snd + "-" + trd);
		}
		
		StringBuilder[] builders = new StringBuilder[3];
		builders[0] = new StringBuilder();
		builders[1] = new StringBuilder();
		builders[2] = new StringBuilder();
		int k = 0;
		for (String phone : phones) {
			if (k % 100 == 0) {
        		System.out.println(String.format("Progress: %.2f %%", (k / (double) phones.size() * 100)));
			}
			k++;
			Collections.shuffle(operatorsList);
			Collections.shuffle(usersList);
			String user = usersList.get(0);
			String city = userCities.get(user);
			String country = cityCountries.get(city);
			String operator = operatorsList.get(0);
			
			String rowValues = new StringBuilder()
					.append(phone)
		            .append(", ")
		            .append(operator)
		            .append(", ")
		            .append(user)
		            .append(", ")
		            .append(city)
		            .append(", ")
		            .append(country)
		            .append(");\n")
		            .toString();
			for (int i = 1; i <= 3; i++) {
				builders[i - 1]
						.append("INSERT INTO grupo2v" + i + ".EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES (")
						.append(rowValues)
						.toString();
			}
		}
		
		for (int i = 1; i <= 3; i++) {
			Files.write(Paths.get(String.format(PATH + "emisorreceptor%d.sql", i)), builders[i - 1].toString().getBytes(), StandardOpenOption.CREATE);
		}

		
		cities.close();
		countries.close();
		firstNames.close();
		lastNames.close();
		operators.close();
	}
}
