package ru.astrodating

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

data class Person(val name: String, val imageResource: Int, val region: String)

@Composable
fun UserListScreen(navController: NavHostController?) {
    val users = listOf(
        Person("John Doe", R.drawable.ic_launcher_foreground, "Saint Petersburg"),
        Person("Jane Smith", R.drawable.ic_launcher_foreground, "Moscow")
    )

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .background(MaterialTheme.colorScheme.background)
    ) {
        items(users) { user ->
            UserCard(person = user, onClick = {
                navController?.navigate("personDetail/${user.name}")
            })
            Spacer(modifier = Modifier.height(8.dp))
        }
    }
}

@Composable
fun UserCard(person: Person, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp)
            .clickable { onClick() },
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.padding(16.dp)
        ) {
            Image(
                painter = painterResource(id = person.imageResource),
                contentDescription = null,
                modifier = Modifier
                    .size(64.dp)
                    .clip(MaterialTheme.shapes.medium)
                    .background(MaterialTheme.colorScheme.onBackground.copy(alpha = 0.1f)),
                contentScale = ContentScale.Crop
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column {
                Text(person.name, style = MaterialTheme.typography.titleLarge)
                Text(person.region, style = MaterialTheme.typography.bodyMedium)
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun UserListScreenPreview() {
    AstrodatingTheme {
        UserListScreen(navController = null)
    }
}
