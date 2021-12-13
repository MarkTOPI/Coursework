using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Theatre.Pages
{
    /// <summary>
    /// Логика взаимодействия для ButtonPage.xaml
    /// </summary>
    public partial class ButtonPage : Page
    {
        public ButtonPage()
        {
            InitializeComponent();
        }

        private void BtnPersonal_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.PersonalAccountingPage());
        }

        private void BtnRepertoire_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.RepertoirePage());
        }
    }
}
