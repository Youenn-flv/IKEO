import mysql.connector as ms
import pandas as pd


def get_data(query):
    
        bdd = ms.connect(user="IKEOutilisateur", password=";nhPA2H8w7^v-3", host="localhost", port="3307", database="IKEO")

        cursor = bdd.cursor()
        cursor.execute(query)
        data = cursor.fetchall()
        dframe = pd.DataFrame(data, columns=cursor.column_names)
        bdd.close()
        return dframe
