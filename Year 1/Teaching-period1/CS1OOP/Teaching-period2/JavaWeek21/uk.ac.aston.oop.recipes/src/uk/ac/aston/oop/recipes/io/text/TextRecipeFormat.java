package uk.ac.aston.oop.recipes.io.text;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import uk.ac.aston.oop.recipes.io.RecipeFormat;
import uk.ac.aston.oop.recipes.io.exceptions.RecipeLoadingException;
import uk.ac.aston.oop.recipes.io.exceptions.RecipeSavingException;
import uk.ac.aston.oop.recipes.model.Recipe;

public class TextRecipeFormat implements RecipeFormat {

	public static final String RECIPE_HEADER = "OOPRecipe 1.0";
	public static final String SEPARATOR_INSTRUCTIONS = "__INSTRUCTIONS__";

	@Override
	public String getExtension() {
		return "txt";
	}

	@Override
	public String getDescription() {
		return "Raw Text Files (*.txt)";
	}

	@Override
	public Recipe load(File f) throws RecipeLoadingException {

		// TODO 1. safely open the file in a try-with-resources
		// TODO 2. catch IOException, wrap it and throw it
		// TODO 3. inside the try block, do the following
//		if (!f.exists()) {
//			throw new RecipeLoadingException("File does not exist." + f.getAbsolutePath());
//		}
		try (FileReader fr = new FileReader(f, StandardCharsets.UTF_8);
			LineNumberReader lnr = new LineNumberReader(fr)) {
			// Line numbers start at 0 by default - make them start at 1
			lnr.setLineNumber(1);
			checkHeader(lnr, f);

			Recipe r = new Recipe();
			readRecipeName(lnr, r);
			readIngredients(lnr, r);
			readInstructions(lnr, r);
			return r;
		} catch (IOException e) {
			throw new RecipeLoadingException("Error while loading recipe file", e);
		}
	}

	private void readInstructions(LineNumberReader lnr, Recipe r) throws IOException {
		// TODO read all the remaining lines and set the instructions
		List<String> lines = new ArrayList<>();
		String line = lnr.readLine();
		while (line != null) {
			lines.add(line);
			line = lnr.readLine();
		}
		String instructions = String.join(System.lineSeparator(), lines);
		r.instructionsProperty().set(instructions);
	}

	private void readIngredients(LineNumberReader lnr, Recipe r) throws IOException, RecipeLoadingException {
		// TODO read all the lines up to end-of-file or SEPARATOR_INSTRUCTIONS
		List<String> lines = new ArrayList<>();
		String line = lnr.readLine();
		while (line != null && !SEPARATOR_INSTRUCTIONS.equals(line)) {
			lines.add(line);
			line = lnr.readLine();
		}
		if (!SEPARATOR_INSTRUCTIONS.equals(line)) {
			throw new RecipeLoadingException("The file is missing the instructions separator. Error on ln: " +lnr.getLineNumber());
		}
		String ingredients = String.join(System.lineSeparator(), lines);
		// TODO set the ingredients property of the recipe
		r.ingredientsProperty().set(ingredients);;
		// TODO if the line is not SEPARATOR_INSTRUCTIONS, throw exception
		
	}

	private void readRecipeName(LineNumberReader lnr, Recipe r) throws IOException, RecipeLoadingException {
		// TODO read a line
		String line = lnr.readLine();

		// TODO if it's null (end-of-file), throw a recipe loading exception
		if (line == null) {
			throw new RecipeLoadingException("Saying that the recipe file ended prematurely. Error on line: " + lnr.getLineNumber());
		}
		// TODO set the name of the recipe
		r.nameProperty().set(line.strip());
	}

	private void checkHeader(LineNumberReader lnr, File f) throws IOException, RecipeLoadingException {
		// TODO read a line
		String line = lnr.readLine();
		// TODO if it's not RECIPE_HEADER, throw a recipe loading exception
		if (!RECIPE_HEADER.equals(line)) {
			throw new RecipeLoadingException("File is not a recipe file (it does not have our header). Error on ln: " + lnr.getLineNumber());
		}
	}

	@Override
	public void save(Recipe r, File f) throws RecipeSavingException {
		/*
		 * TODO If the property contains SEPARATOR_INSTRUCTIONS, throw a recipe saving
		 * exception (cannot safely store the recipe in this format).
		 */
		if (r.ingredientsProperty().get().contains(SEPARATOR_INSTRUCTIONS)) {
			throw new RecipeSavingException("Cannot save files with that bit of text in its ingredients in the custom text format");
		}
		try (FileWriter fw = new FileWriter(f, StandardCharsets.UTF_8);
				PrintWriter pw = new PrintWriter(fw);) {
			pw.println(RECIPE_HEADER);
			pw.println(r.nameProperty().get());
			pw.println(r.ingredientsProperty().get());
			pw.println(SEPARATOR_INSTRUCTIONS);
			pw.println(r.instructionsProperty().get());
		} catch (IOException e) {
			throw new RecipeSavingException("Error while saving recipe file", e);
		}
	}

}
