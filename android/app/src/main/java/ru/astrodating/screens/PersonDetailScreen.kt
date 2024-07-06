package ru.astrodating

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun PersonDetailScreen(navController: NavController?, personName: String?) {
//fun PersonDetailScreen(person: Person, navController: NavHostController?) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .background(MaterialTheme.colorScheme.background),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.SpaceBetween
    ) {
//        Image(
//            painter = painterResource(id = person.imageResource),
//            contentDescription = null,
//            modifier = Modifier
//                .size(300.dp)
//                .clip(MaterialTheme.shapes.medium)
//                .background(MaterialTheme.colorScheme.onBackground.copy(alpha = 0.1f)),
//            contentScale = ContentScale.Crop
//        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(personName ?: "Unknown", style = MaterialTheme.typography.headlineMedium)
//        Text("Region: ${person.region}", style = MaterialTheme.typography.bodyLarge)
        Spacer(modifier = Modifier.height(16.dp))
        Button(onClick = {
            navController?.navigate("chat/${personName}")
//            navController?.navigate("chat/${person.name}")
                         }, modifier = Modifier.fillMaxWidth()) {
            Text("Chat")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun PersonDetailScreenPreview() {
    AstrodatingTheme {
        PersonDetailScreen(navController = null, personName = "John Doe")
    }
}
