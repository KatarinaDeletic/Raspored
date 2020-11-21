echo "Changing directory."
cd .. 
echo -e "\nExecuting ef command...\n"
dotnet ef dbcontext scaffold "data source=.;Initial Catalog=BAZA;Integrated Security=true" Microsoft.EntityFrameworkCore.SqlServer -o Models -f --project Baza
echo ""
echo ""
echo "Done, have fun."