package uk.ac.aston.oop.javafx.assessed;

import java.io.IOException;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import uk.ac.aston.oop.javafx.assessed.model.CD;
import uk.ac.aston.oop.javafx.assessed.model.Database;
import uk.ac.aston.oop.javafx.assessed.model.Item;

public class ListController {

	@FXML
	private ListView<Item> listItems;

	private final Database model;

	public ListController(Database model) {
		this.model = model;
	}

	@FXML
	public void initialize() {
		listItems.setItems(model.itemsProperty());
	}

	@FXML
	public void shufflePressed() {
		FXCollections.shuffle(model.itemsProperty());
	}

	@FXML
	public void quitPressed() {
		listItems.getScene().getWindow().hide();
	}

	@FXML
	public void removePressed() {
		int selectedIdx = listItems.getSelectionModel().getSelectedIndex();
		if (selectedIdx >= 0) {
			final Item selectedItem = listItems.getSelectionModel().getSelectedItem();

			final FXMLLoader loader = new FXMLLoader();
			loader.setLocation(getClass().getResource("RemoveItem.fxml"));
			final RemoveController controller = new RemoveController(selectedItem);
			loader.setController(controller);
			try {
				final Parent parent = (Parent) loader.load();

				final Stage removeStage = new Stage();
				removeStage.initModality(Modality.APPLICATION_MODAL);
				removeStage.setScene(new Scene(parent, 250, 200));
				removeStage.showAndWait();

				if (controller.isConfirmed()) {
					model.itemsProperty().remove(selectedIdx);
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}
	// On Action addition for Week20 lab
	@FXML
	public void addPressed() {
//		System.out.println("add was pressed!");
		final FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("CreateCD.fxml"));
		final CreateCDController cd = new CreateCDController();
		loader.setController(cd);
		try {
			final Parent parent = (Parent) loader.load();
			
			final Stage addStage = new Stage();
			addStage.initModality(Modality.APPLICATION_MODAL);
			addStage.setScene(new Scene(parent, 400, 300));
			addStage.setTitle("Create CD");
			addStage.showAndWait();
			
			if (cd.isConfirmed()) {
				CD newCD = new CD(cd.getTitleText(), cd.getArtText(), cd.getNumTracks(), cd.getTime());
				if (cd.isOwnChecked()) {
					newCD.setOwn(true);
				} else {
					newCD.setOwn(false);
				}
				model.itemsProperty().add(newCD);
			}

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

}
