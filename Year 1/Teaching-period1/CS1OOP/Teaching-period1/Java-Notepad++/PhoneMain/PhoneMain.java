import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public class PhoneMain {
	
	public static String fileName;
	public static PhoneList allPhones;
	public static Scanner in;
	public static PhoneMap map;
	
	public static void readData() {
		String header = in.nextLine();
		System.out.println(header);
		
		while (in.hasNext()) {
			String csv = in.nextLine();
			String[] data = csv.split(",");
			Phone p = new Phone(data[0]);
			p.setModel(data[1]);
			p.setAnnounced(data[8]);
			float w = Float.parseFloat(data[11]);
			p.setWeight_g(w);
			p.setInternal_memory(data[21]);
			int price = Integer.parseInt(data[36]);
			p.setApprox_price_EUR(price);
			
			allPhones.addPhone(p);
			map.addPhone(p);
		}
		
		System.out.println("------------------------------------");
		System.out.println("Total number of phones is " + allPhones.getNOP());
		//println(map.getNOP());
	}
	
	public class InputReader {
		public static final Scanner getScanner(String file) {
			try {
				return new Scanner(new File(file));
			}
			catch (FileNotFoundException e) {
				System.out.println(e.getMessage());
				return null;
			}
		}
	}
		
	/**
	 *
	 * @author Dr Tony Beaumont (2019)
	 */
	public static class Phone implements Comparable<Phone>{
	  
	  // SORTING IMPORTANT
	  public int compareTo(Phone otherPhone) {
		int result = otherPhone.approx_price_EUR - approx_price_EUR;
		return result;
	  }

	  private String brand;  // 0
	  private String model;  // 1
	  private String network_technology;
	  private String ThreeG_bands;
	  private String FourG_bands;
	  private String network_speed; // 5
	  private String GPRS;
	  private String EDGE;
	  private String announced;  // 8
	  private String status;
	  private String dimentions;  // 10
	  private float weight_g; // 11
	  private String SIM;
	  private String display_type;
	  private String display_resolution;
	  private String display_size; // 15
	  private String OS;
	  private String CPU;
	  private String Chipset;
	  private String GPU;
	  private String memory_card; // 20
	  private String internal_memory;
	  private String RAM;  // 22
	  private String primary_camera;
	  private String secondary_camera;
	  private String loud_speaker;  // 25
	  private String audio_jack;
	  private String WLAN;
	  private String bluetooth;
	  private String GPS;
	  private String NFC; // 30
	  private String radio;
	  private String USB;
	  private String sensors;
	  private String battery;
	  private String colors; // 35
	  private int approx_price_EUR; // 36
	  private String img_url; // 37

	  public Phone(String brand) {
		this.brand = brand;
	  }

	  // Add a compareTo function here...

	  /**
	   * @return the brand
	   */
	  public String getBrand() {
		return brand;
	  }

	  /**
	   * @return the model
	   */
	  public String getModel() {
		return model;
	  }

	  /**
	   * @param model the model to set
	   */
	  public void setModel(String model) {
		this.model = model;
	  }

	  /**
	   * @return the network_technology
	   */
	  public String getNetwork_technology() {
		return network_technology;
	  }

	  /**
	   * @param network_technology the network_technology to set
	   */
	  public void setNetwork_technology(String network_technology) {
		this.network_technology = network_technology;
	  }

	  /**
	   * @return the ThreeG_bands
	   */
	  public String getThreeG_bands() {
		return ThreeG_bands;
	  }

	  /**
	   * @param ThreeG_bands the ThreeG_bands to set
	   */
	  public void setThreeG_bands(String ThreeG_bands) {
		this.ThreeG_bands = ThreeG_bands;
	  }

	  /**
	   * @return the FourG_bands
	   */
	  public String getFourG_bands() {
		return FourG_bands;
	  }

	  /**
	   * @param FourG_bands the FourG_bands to set
	   */
	  public void setFourG_bands(String FourG_bands) {
		this.FourG_bands = FourG_bands;
	  }

	  /**
	   * @return the network_speed
	   */
	  public String getNetwork_speed() {
		return network_speed;
	  }

	  /**
	   * @param network_speed the network_speed to set
	   */
	  public void setNetwork_speed(String network_speed) {
		this.network_speed = network_speed;
	  }

	  /**
	   * @return the GPRS
	   */
	  public String getGPRS() {
		return GPRS;
	  }

	  /**
	   * @param GPRS the GPRS to set
	   */
	  public void setGPRS(String GPRS) {
		this.GPRS = GPRS;
	  }

	  /**
	   * @return the EDGE
	   */
	  public String getEDGE() {
		return EDGE;
	  }

	  /**
	   * @param EDGE the EDGE to set
	   */
	  public void setEDGE(String EDGE) {
		this.EDGE = EDGE;
	  }

	  /**
	   * @return the announced
	   */
	  public String getAnnounced() {
		return announced;
	  }

	  /**
	   * @param announced the announced to set
	   */
	  public void setAnnounced(String announced) {
		this.announced = announced;
	  }

	  /**
	   * @return the status
	   */
	  public String getStatus() {
		return status;
	  }

	  /**
	   * @param status the status to set
	   */
	  public void setStatus(String status) {
		this.status = status;
	  }

	  /**
	   * @return the dimentions
	   */
	  public String getDimentions() {
		return dimentions;
	  }

	  /**
	   * @param dimentions the dimentions to set
	   */
	  public void setDimentions(String dimentions) {
		this.dimentions = dimentions;
	  }

	  /**
	   * @return the weight_g
	   */
	  public float getWeight_g() {
		return weight_g;
	  }

	  /**
	   * @param weight_g the weight_g to set
	   */
	  public void setWeight_g(float weight_g) {
		this.weight_g = weight_g;
	  }

	  /**
	   * @return the SIM
	   */
	  public String getSIM() {
		return SIM;
	  }

	  /**
	   * @param SIM the SIM to set
	   */
	  public void setSIM(String SIM) {
		this.SIM = SIM;
	  }

	  /**
	   * @return the display_type
	   */
	  public String getDisplay_type() {
		return display_type;
	  }

	  /**
	   * @param display_type the display_type to set
	   */
	  public void setDisplay_type(String display_type) {
		this.display_type = display_type;
	  }

	  /**
	   * @return the display_resolution
	   */
	  public String getDisplay_resolution() {
		return display_resolution;
	  }

	  /**
	   * @param display_resolution the display_resolution to set
	   */
	  public void setDisplay_resolution(String display_resolution) {
		this.display_resolution = display_resolution;
	  }

	  /**
	   * @return the display_size
	   */
	  public String getDisplay_size() {
		return display_size;
	  }

	  /**
	   * @param display_size the display_size to set
	   */
	  public void setDisplay_size(String display_size) {
		this.display_size = display_size;
	  }

	  /**
	   * @return the OS
	   */
	  public String getOS() {
		return OS;
	  }

	  /**
	   * @param OS the OS to set
	   */
	  public void setOS(String OS) {
		this.OS = OS;
	  }

	  /**
	   * @return the CPU
	   */
	  public String getCPU() {
		return CPU;
	  }

	  /**
	   * @param CPU the CPU to set
	   */
	  public void setCPU(String CPU) {
		this.CPU = CPU;
	  }

	  /**
	   * @return the Chipset
	   */
	  public String getChipset() {
		return Chipset;
	  }

	  /**
	   * @param Chipset the Chipset to set
	   */
	  public void setChipset(String Chipset) {
		this.Chipset = Chipset;
	  }

	  /**
	   * @return the GPU
	   */
	  public String getGPU() {
		return GPU;
	  }

	  /**
	   * @param GPU the GPU to set
	   */
	  public void setGPU(String GPU) {
		this.GPU = GPU;
	  }

	  /**
	   * @return the memory_card
	   */
	  public String getMemory_card() {
		return memory_card;
	  }

	  /**
	   * @param memory_card the memory_card to set
	   */
	  public void setMemory_card(String memory_card) {
		this.memory_card = memory_card;
	  }

	  /**
	   * @return the internal_memory
	   */
	  public String getInternal_memory() {
		return internal_memory;
	  }

	  /**
	   * @param internal_memory the internal_memory to set
	   */
	  public void setInternal_memory(String internal_memory) {
		this.internal_memory = internal_memory;
	  }

	  /**
	   * @return the RAM
	   */
	  public String getRAM() {
		return RAM;
	  }

	  /**
	   * @param RAM the RAM to set
	   */
	  public void setRAM(String RAM) {
		this.RAM = RAM;
	  }

	  /**
	   * @return the primary_camera
	   */
	  public String getPrimary_camera() {
		return primary_camera;
	  }

	  /**
	   * @param primary_camera the primary_camera to set
	   */
	  public void setPrimary_camera(String primary_camera) {
		this.primary_camera = primary_camera;
	  }

	  /**
	   * @return the secondary_camera
	   */
	  public String getSecondary_camera() {
		return secondary_camera;
	  }

	  /**
	   * @param secondary_camera the secondary_camera to set
	   */
	  public void setSecondary_camera(String secondary_camera) {
		this.secondary_camera = secondary_camera;
	  }

	  /**
	   * @return the loud_speaker
	   */
	  public String getLoud_speaker() {
		return loud_speaker;
	  }

	  /**
	   * @param loud_speaker the loud_speaker to set
	   */
	  public void setLoud_speaker(String loud_speaker) {
		this.loud_speaker = loud_speaker;
	  }

	  /**
	   * @return the audio_jack
	   */
	  public String getAudio_jack() {
		return audio_jack;
	  }

	  /**
	   * @param audio_jack the audio_jack to set
	   */
	  public void setAudio_jack(String audio_jack) {
		this.audio_jack = audio_jack;
	  }

	  /**
	   * @return the WLAN
	   */
	  public String getWLAN() {
		return WLAN;
	  }

	  /**
	   * @param WLAN the WLAN to set
	   */
	  public void setWLAN(String WLAN) {
		this.WLAN = WLAN;
	  }

	  /**
	   * @return the bluetooth
	   */
	  public String getBluetooth() {
		return bluetooth;
	  }

	  /**
	   * @param bluetooth the bluetooth to set
	   */
	  public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	  }

	  /**
	   * @return the GPS
	   */
	  public String getGPS() {
		return GPS;
	  }

	  /**
	   * @param GPS the GPS to set
	   */
	  public void setGPS(String GPS) {
		this.GPS = GPS;
	  }

	  /**
	   * @return the NFC
	   */
	  public String getNFC() {
		return NFC;
	  }

	  /**
	   * @param NFC the NFC to set
	   */
	  public void setNFC(String NFC) {
		this.NFC = NFC;
	  }

	  /**
	   * @return the radio
	   */
	  public String getRadio() {
		return radio;
	  }

	  /**
	   * @param radio the radio to set
	   */
	  public void setRadio(String radio) {
		this.radio = radio;
	  }

	  /**
	   * @return the USB
	   */
	  public String getUSB() {
		return USB;
	  }

	  /**
	   * @param USB the USB to set
	   */
	  public void setUSB(String USB) {
		this.USB = USB;
	  }

	  /**
	   * @return the sensors
	   */
	  public String getSensors() {
		return sensors;
	  }

	  /**
	   * @param sensors the sensors to set
	   */
	  public void setSensors(String sensors) {
		this.sensors = sensors;
	  }

	  /**
	   * @return the battery
	   */
	  public String getBattery() {
		return battery;
	  }

	  /**
	   * @param battery the battery to set
	   */
	  public void setBattery(String battery) {
		this.battery = battery;
	  }

	  /**
	   * @return the colors
	   */
	  public String getColors() {
		return colors;
	  }

	  /**
	   * @param colors the colors to set
	   */
	  public void setColors(String colors) {
		this.colors = colors;
	  }

	  /**
	   * @return the approx_price_EUR
	   */
	  public int getApprox_price_EUR() {
		return approx_price_EUR;
	  }

	  /**
	   * @param approx_price_EUR the approx_price_EUR to set
	   */
	  public void setApprox_price_EUR(int approx_price_EUR) {
		this.approx_price_EUR = approx_price_EUR;
	  }

	  /**
	   * @return the img_url
	   */
	  public String getImg_url() {
		return img_url;
	  }

	  /**
	   * @param img_url the img_url to set
	   */
	  public void setImg_url(String img_url) {
		this.img_url = img_url;
	  }

	  public String toString() {
		return brand + ", " + model + ", " + announced + ", " + weight_g + ", " + internal_memory + ", " +approx_price_EUR + " euros";
	  }
	}
	
	
	public static class PhoneList {
		private ArrayList<Phone> phones;
		
		public PhoneList() {
			phones = new ArrayList<>();
		}
		
		public void addPhone(Phone p) {
			phones.add(p);
		}
		
		public int getNOP() {
			return phones.size();
		}
		
		public String toString() {
			String result = "";
			for (int index= 0; index < phones.size(); index++) {
				Phone p = phones.get(index);
				result = result + p.toString();
				result = result + "\n";
			}
			return result;
		}
		
		public void sort() {
			Collections.sort(phones);
		}
		
		public Phone search4phone(String brand, String model) {
			for (int index = 0; index < phones.size(); index++) {
				Phone thisPhone = phones.get(index);
				if (thisPhone.getBrand().equals(brand) && thisPhone.getModel().equals(model)) {
					return thisPhone;
				}
			}
			return null;
		}
		
		public PhoneList phones_at_price(int price) {
			PhoneList list = new PhoneList();
			for (int index = 0; index < phones.size(); index++) {
				Phone thisPhone = phones.get(index);
				if (price < thisPhone.getApprox_price_EUR()) {
					list.addPhone(thisPhone);
				}
			}
			return list;
		}
		
		public PhoneList findPhonesInPriceRange(int lowerP, int higherP) {
			if (lowerP > higherP) {
				System.out.println("The first parameter must be smaller than the second...");
			}
			PhoneList list = new PhoneList();
			for (int index = 0; index < phones.size(); index++) {
				Phone thisPhone = phones.get(index);
				if (thisPhone.getApprox_price_EUR() >= lowerP && thisPhone.getApprox_price_EUR() <= higherP) {
					list.addPhone(thisPhone);
				}
			}
			return list;
		}
	}
	
	public static class PhoneMap {
		
		private HashMap<String, Phone> phones;
		
		public PhoneMap() {
			phones = new HashMap<>();
		}
		
		public void addPhone(Phone phone) {
			String k = phone.getBrand() + "-" + phone.getModel();
			phones.put(k, phone);
		}
		
		public int getNOP() {
			return phones.size();
		}
		
		public String toString() {
			String result = "";
			for (Phone phone : phones.values() ) {
				result += "\n" + phone.toString();
			}
			return result;
		}
		
		public Phone search(String brand, String model) {
			return phones.get(brand + "-" + model);
		}
	}
	
	public static void main(String[] args) {
		
		fileName = "C:/Users/muham/OneDrive - Aston University/Desktop/Comp Sci Degree Docs/Teaching term 1/CS1OOP/Java-Notepad++/PhoneMain/phoneData.csv";
		allPhones = new PhoneList();
		in = InputReader.getScanner(fileName);
		map = new PhoneMap();
		readData();
		allPhones.sort();
		// System.out.println(allPhones.toString());
		
		// /*
		// this phone exists
		// */
		// Phone iPhone7Plus = allPhones.search4phone("Apple", "iPhone 7 Plus");
		// System.out.println("\niPhone 7 Plus stats are: ");
		// System.out.println(iPhone7Plus);
		
		// /*
		// fake phone null test
		// */
		// Phone fake = allPhones.search4phone("fake", "fake");
		// System.out.println("\nfake stats are: ");
		// System.out.println(fake);
		
		// // prints Phonelist of phones higher than 600 euros
		// PhoneList higher_600 = allPhones.phones_at_price(600);
		// higher_600.sort();
		// System.out.println("\nPhones higher than 600 euros;");
		// System.out.println(higher_600.toString());
		
		// // printing PhoneMap map
		// System.out.println(map.toString());
		
		// // using PhoneMap to search
		// Phone foundPhone = map.search("Samsung", "Galaxy S7 (USA)");
		// System.out.println("\nFoundPhone: "+foundPhone);
		
		// // testing findPhonesInPriceRange();
		// PhoneList test = allPhones.findPhonesInPriceRange(900, 2000);
		// System.out.println(test.toString());
		
		// PhoneList wrongParameters = allPhones.findPhonesInPriceRange(2000, 900);
		// System.out.println(wrongParameters.toString());
		
		// // taking user inputs for findPhonesInPriceRange using Scanner object
		Scanner UserInput = new Scanner(System.in); // Create a Scanner object
		
		System.out.println("Enter a lower price bound ");
		int lowerBound = UserInput.nextInt();
		
		System.out.println("Enter a upper price bound ");
		int upperBound = UserInput.nextInt();
		
		PhoneList UserFound = allPhones.findPhonesInPriceRange(lowerBound, upperBound);
		UserFound.sort();
		System.out.println("\nPhones within your range in our database (Num of Phones "+ UserFound.getNOP()+"):\n----------------------------------------------------------------------------------------\n"+ UserFound.toString());
		if (UserFound.getNOP() == 0 && lowerBound < upperBound) {
			System.out.println("We have no phones within the given price range");
		}
	}
}