package uk.ac.aston.oop.javafx.prep;

import javafx.fxml.FXML;
import javafx.scene.Scene;
import javafx.stage.Window;
import uk.ac.aston.oop.javafx.prep.model.Item;

public class RemoveController {
	
	@FXML private javafx.scene.control.Label lblItem;
	private Item selectedItem;
	private boolean confirmed = false;
	
	public RemoveController(Item selectedItem) {
		this.selectedItem = selectedItem;
	}
	
	public boolean isConfirmed() {
		return this.confirmed;
	}
	
	@FXML
	public void initialize() {
		lblItem.setText(selectedItem.toString());
	}
	// On... methods (for buttons)
	@FXML
	public void cancelPressed() {
		this.confirmed = false;
		
		Scene scene = lblItem.getScene();
		Window window = scene.getWindow();
		window.hide();
	}
	@FXML
	public void confirmPressed() {
		this.confirmed = true;
		
		Scene scene = lblItem.getScene();
		Window window = scene.getWindow();
		window.hide();
	}
}
