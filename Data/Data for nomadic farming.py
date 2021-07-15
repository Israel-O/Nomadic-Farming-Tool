def writeToFile(data_file, position):
    line = "C:\\Users\\DAPO OGUNMOLA\\Documents\\Data for Nomadic Farming\\Data\\" + data_file
    file = open(line,"r")
    hum_line = "C:\\Users\\DAPO OGUNMOLA\\Documents\\Data for Nomadic Farming\\Data\\Humidity_" + position + ".txt"
    humidity = open(hum_line,'w')
    temp_line = "C:\\Users\\DAPO OGUNMOLA\\Documents\\Data for Nomadic Farming\\Data\\Temperature_" + position + ".txt"
    temp = open(temp_line,'w')
    light_line = "C:\\Users\\DAPO OGUNMOLA\\Documents\\Data for Nomadic Farming\\Data\\LightIntensity_" + position + ".txt"
    light = open(light_line,'w')
    for i in range(7200):
        humidity.write(file.readline())
        temp.write(file.readline())
        light.write(file.readline())

    file.close()
    humidity.close()
    light.close()
    temp.close()

def main():
    data_file = input('What is the file name to read from: ')
    position = input('What is the location number for this place: ')
    print('Writing to files...')
    writeToFile(data_file, position)
    print('Success')
    input('Press enter to exit')

main()
