kata = (0, 4, 132.42222, 10000, 12345.67)

scientific_notation1="{:.2e}".format(kata[3])
scientific_notation2="{:.2e}".format(kata[4])

print(f'module_{kata[0]:02d}, ex_{kata[1]:02d} : {kata[2]:.2f}, {scientific_notation1}, {scientific_notation2}')