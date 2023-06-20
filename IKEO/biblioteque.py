from data import get_data
import streamlit as st
import seaborn as sb
import matplotlib.pyplot as plt


def fonction_de_construction_projet():
    st.title(":construction::rotating_light: :red[project in progresse] :rotating_light::construction:")

def afficher_tous_les_produits_ainsi_que_leurs_sites_de_production():
    query = """
            SELECT produits.nom AS Nom, GROUP_CONCAT(site_de_production.nom) AS Sites_de_production
            FROM produits
            LEFT JOIN sites_produit ON produits.id_produit = sites_produit.id_produit
            LEFT JOIN site_de_production ON sites_produit.id_site = site_de_production.id_site
            GROUP BY produits.nom
            """
    datafram = (get_data(query))

    sb.set(rc={'axes.facecolor':'#FEEAA1', 'figure.facecolor':'#D6955B'})

    st.title("produits et sites de production :factory::")

    st.dataframe(datafram)

def produits_par_usine():

    st.title('produit par usine :t-rex: :')

    query_usines = "SELECT id_site, nom FROM site_de_production"
    usines_df = get_data(query_usines)
    usine_selectionnee = st.selectbox('Choisissez une usine', usines_df['nom'])

    sb.set(rc={'axes.facecolor':'#FEEAA1', 'figure.facecolor':'#D6955B'})

    query_produits = """
            SELECT produits.nom AS Nom
            FROM produits
            INNER JOIN sites_produit ON produits.id_produit = sites_produit.id_produit
            INNER JOIN site_de_production ON sites_produit.id_site = site_de_production.id_site
            WHERE site_de_production.nom = '{}'
            """.format(usine_selectionnee)
    produits_df = get_data(query_produits)
    st.dataframe(produits_df)

def afficher_un_graphique_des_commandes_par_produits():
    

    st.title('commandes par produits :truck: :')
    query = """
        SELECT produits.nom AS Nom, COUNT(factures.id_facture) AS Commandes
        FROM produits
        LEFT JOIN produit_facture ON produits.id_produit = produit_facture.id_produit
        LEFT JOIN factures ON produit_facture.id_facture = factures.id_facture
        GROUP BY produits.nom
        """
    dataframe = get_data(query)

    sb.set(rc={'axes.facecolor':'#FEEAA1', 'figure.facecolor':'#D6955B'})

    fig, ax = plt.subplots()
    ax.bar(dataframe['Nom'], dataframe['Commandes'], color='#264653')
    ax.set_xlabel('Produit')
    ax.set_ylabel('Nombre de commandes')
    ax.set_title('Graphique des commandes par produit')
    ax.tick_params(axis='x', rotation=90)

    sb.set(rc={'axes.facecolor':'#FEEAA1', 'figure.facecolor':'#D6955B'})


    st.pyplot(fig)

def afficher_un_graphique_des_commandes_par_clients():

    st.title('commandes par clients :man_in_business_suit_levitating: :')

    query = """
        SELECT clients.raison_social AS Client, COUNT(factures.id_facture) AS Commandes
        FROM clients
        LEFT JOIN factures ON clients.id_client = factures.id_client
        GROUP BY clients.raison_social
        """
    dataframe = get_data(query)

    sb.set(rc={'axes.facecolor':'#FEEAA1', 'figure.facecolor':'#D6955B'})

    fig, ax = plt.subplots()
    ax.bar(dataframe['Client'], dataframe['Commandes'], color='#264653')
    ax.set_xlabel('Client')
    ax.set_ylabel('Nombre de commandes')
    ax.set_title('Graphique des commandes par client')
    ax.tick_params(axis='x', rotation=90)
    st.pyplot(fig)